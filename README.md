# FrammerAI Contact Management System

## Overview

The **FrammerAI Contact Management System** is a web-based application that allows users to perform CRUD (Create, Read, Update, Delete) operations on contact data. It is designed to handle large datasets efficiently with features like pagination, sorting, and searching. The backend is built using **Flask (Python)**, with **MySQL** for database management, and a responsive frontend powered by **JavaScript** and **AJAX**.

---

## Features

- **User-Friendly Interface**
  - Simple web interface with **Bootstrap** and **DataTables**.
  - Enhanced notifications using **SweetAlert2**.

- **CRUD Operations**
  - Add, update, delete, and view contact records without page refresh.

- **Efficient Data Management**
  - Pagination for large datasets.
  - Sorting and searching with **DataTables**.

- **Robust Backend**
  - RESTful API endpoints implemented with **Flask**.
  - Secure data storage using **MySQL**.

- **Form Validation**
  - Client-side validation for **Name**, **Email**, and **Phone** fields.
  - Seamless form submission with **AJAX**.

---

## System Architecture

### Frontend
- **Technologies:** HTML, CSS, JavaScript, jQuery, Bootstrap, DataTables, SweetAlert2.
- **Key Features:**
  - Responsive form for capturing **Name**, **Email**, and **Phone**.
  - Dynamic table for displaying and updating contact records.
  - DataTables for sorting, searching, and pagination.

### Backend
- **Technologies:** Python (Flask), PyMySQL.
- **Key Files:**
  - `__init__.py`: Application factory and CORS configuration.
  - `routes.py`: API endpoints for CRUD operations.
  - `db.py`: Database connection handler.

- **Functionalities:**
  - RESTful API endpoints for client requests.
  - CRUD operations with MySQL.

### Database
- **Technology:** MySQL.
- **Schema:**
  - `records` table:
    - `id`: Auto-increment primary key.
    - `name`: String for contact name.
    - `email`: String for contact email.
    - `phone`: String for contact phone.

---

## API Documentation

### Base URL
`http://<your-server-address>`

### Endpoints

1. **POST `/api/data`**
   - **Description:** Adds a new record.
   - **Request Body:**
     ```json
     {
       "name": "John Doe",
       "email": "john.doe@example.com",
       "phone": "1234567890"
     }
     ```
   - **Response:**
     - `201 Created`: Record added successfully.
     - `400 Bad Request`: Missing or invalid fields.

2. **GET `/api/data`**
   - **Description:** Retrieves all records.
   - **Response:**
     ```json
     [
       {
         "id": 1,
         "name": "John Doe",
         "email": "john.doe@example.com",
         "phone": "1234567890"
       }
     ]
     ```

3. **PUT `/api/data/<id>`**
   - **Description:** Updates a record.
   - **Request Body:**
     ```json
     {
       "name": "Jane Doe",
       "email": "jane.doe@example.com",
       "phone": "0987654321"
     }
     ```
   - **Response:**
     - `200 OK`: Record updated successfully.
     - `400 Bad Request`: Missing or invalid fields.

4. **DELETE `/api/data/<id>`**
   - **Description:** Deletes a record.
   - **Response:** `200 OK`: Record deleted successfully.

5. **GET `/api/table_data`**
   - **Description:** Retrieves paginated data for DataTables.
   - **Query Parameters:**
     - `draw`: Counter for DataTables.
     - `start`: Starting record index.
     - `length`: Number of records per page.
   - **Response:**
     ```json
     {
       "draw": 1,
       "recordsTotal": 100,
       "recordsFiltered": 100,
       "records": [
         {
           "id": 1,
           "name": "John Doe",
           "email": "john.doe@example.com",
           "phone": "1234567890"
         }
       ]
     }
     ```

---

## Setup and Deployment

### Requirements
- Python 3.10+
- MySQL 8.0+

### Installation Steps
1. **Clone the repository:**
   ```bash
   git clone <repository-url>
   cd frammerai
