# Assignment #10
## Supabase and Dart

### Endpoint 1: User Login

- **Endpoint Name:** `/login`
- **Method:** `POST`
- **Description:** This endpoint is used to authenticate and log in a user in `Supabase`.

**Request Parameters:**

- `username` (string, required): The username of the user.
- `password` (string, required): The password of the user.

**Response:**

- **Success (Status 200):**
  - **Response Body:** A JSON object containing the user's information, such as user ID, name, and token.

- **Error (Status 401):**
  - **Response Body:** A JSON object with an error message indicating invalid credentials or authentication failure.

### Endpoint 2: User Sign Up

- **Endpoint Name:** `/signup`
- **Method:** `POST`
- **Description:** This endpoint is used to create a new user account and add the user to the user table.

**Request Parameters:**

- `username` (string, required): The desired username for the new user.
- `password` (string, required): The password for the new user.
- `email` (string, required): The email address of the new user.
- `name` (string, required): The name of the new user.

**Response:**

- **Success (Status 201):**
  - **Response Body:** A JSON object containing the newly created user's information, such as user ID, name, and token.

- **Error (Status 400):**
  - **Response Body:** A JSON object with an error message indicating invalid input or a duplicate username/email.

### Table
<a href="https://ibb.co/nRv88kH"><img src="https://i.ibb.co/kMf66cR/Whats-App-Image-2023-05-18-at-13-11-11.jpg" alt="Whats-App-Image-2023-05-18-at-13-11-11" border="0"></a>
