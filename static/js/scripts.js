$(document).ready(function () {
    const dataForm = $('#dataForm');
    const submitButton = $('#submitButton');

    // Function to validate form inputs
    function validateForm() {
        const name = $('#name').val().trim();
        const email = $('#email').val().trim();
        const phone = $('#phone').val().trim();

        // Name validation
        if (!/^[A-Za-z\s]{2,}$/.test(name)) {
            Swal.fire({
                title: 'Invalid Name',
                text: 'Name must be at least 2 characters long and contain only letters and spaces.',
                icon: 'error',
            });
            return false;
        }

        // Email validation
        if (!/^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(email)) {
            Swal.fire({
                title: 'Invalid Email',
                text: 'Please enter a valid email address.',
                icon: 'error',
            });
            return false;
        }

        // Phone validation
        if (!/^\d{10}$/.test(phone)) {
            Swal.fire({
                title: 'Invalid Phone Number',
                text: 'Phone number must be exactly 10 digits.',
                icon: 'error',
            });
            return false;
        }

        return true; // If all validations pass
    }

    // Handle form submission
    dataForm.submit(function (e) {
        e.preventDefault();

        // Validate form inputs
        if (!validateForm()) {
            return; // Stop submission if validation fails
        }

        const id = $('#recordId').val();
        const formData = {
            name: $('#name').val().trim(),
            email: $('#email').val().trim(),
            phone: $('#phone').val().trim(),
        };

        const method = id ? 'PUT' : 'POST';
        const url = id ? `/api/data/${id}` : '/api/data';

        $.ajax({
            url,
            type: method,
            contentType: 'application/json',
            data: JSON.stringify(formData),
            success: function () {
                $('#dataTable').DataTable().ajax.reload(); // Reload the DataTable
                dataForm[0].reset(); // Reset the form
                submitButton.text('Add Record');
                $('#recordId').val('');

                Swal.fire({
                    title: 'Success!',
                    text: id ? 'Record updated successfully!' : 'Record added successfully!',
                    icon: 'success',
                });
            },
            error: function () {
                Swal.fire({
                    title: 'Error',
                    text: 'An error occurred while processing your request.',
                    icon: 'error',
                });
            },
        });
    });

    // Delete Record
    window.deleteRecord = function (id) {
        Swal.fire({
            title: 'Are you sure?',
            text: 'Do you want to delete this record?',
            icon: 'warning',
            showCancelButton: true,
            confirmButtonColor: '#d33',
            cancelButtonColor: '#3085d6',
            confirmButtonText: 'Yes, delete it!',
        }).then((result) => {
            if (result.isConfirmed) {
                $.ajax({
                    url: `/api/data/${id}`,
                    type: 'DELETE',
                    success: function () {
                        $('#dataTable').DataTable().ajax.reload(); // Reload the DataTable
                        Swal.fire({
                            title: 'Deleted!',
                            text: 'Record has been deleted.',
                            icon: 'success',
                        });
                    },
                    error: function () {
                        Swal.fire({
                            title: 'Error',
                            text: 'Failed to delete the record.',
                            icon: 'error',
                        });
                    },
                });
            }
        });
    };

    // Edit Record
    window.editRecord = function (id, name, email, phone) {
        $('#name').val(name);
        $('#email').val(email);
        $('#phone').val(phone);
        $('#recordId').val(id);
        submitButton.text('Update Record');
    };

    // Initialize DataTable
    const dataTable = $('#dataTable').DataTable({
        serverSide: true,
        processing: true,
        ajax: {
            url: '/api/table_data',
            dataSrc: 'records',
        },
        columns: [
            {
                data: null,
                render: function (data, type, row, meta) {
                    return meta.row + 1 + meta.settings._iDisplayStart; // Sequence number
                },
                orderable: false,
            },
            { data: 'name' },
            { data: 'email' },
            { data: 'phone' },
            {
                data: null,
                render: function (data, type, row) {
                    return `
                        <button class="edit btn btn-primary" onclick="editRecord(${row.id}, '${row.name}', '${row.email}', '${row.phone}')">Edit</button>
                        <button class="delete btn btn-danger" onclick="deleteRecord(${row.id})">Delete</button>
                    `;
                },
                orderable: false,
            },
        ],
        pageLength: 10,
        order: [],
    });
});
