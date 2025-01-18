# Jakarta EE Project

## Overview
This project is a web application built using Jakarta EE, featuring user authentication (login and registration) and a homepage displaying items. The project demonstrates core Jakarta EE functionalities, including servlets, JSPs, and integration with a database for persistent storage.

## Features

### User Authentication
- **Registration:**
  - Users can create an account by providing their details (e.g., username, password, email).

- **Login:**
  - Registered users can log in with their credentials.

### Home Page
- **Item Listing:**
  - The homepage displays a dynamic list of items retrieved from the database.
  - Each item has details like title, description, and price.

## Technologies Used
- **Jakarta EE:** Core framework for the application.
- **Servlets and JSPs:** For backend processing and dynamic content generation.
- **Database:**
  - Relational database (e.g., MySQL or PostgreSQL) for storing user data and items.
  - JDBC for database connectivity.
- **Bootstrap:** Enhances the frontend with responsive and modern UI components.

## Setup Instructions

### Prerequisites
1. Java Development Kit (JDK) 11 or higher.
2. A compatible Jakarta EE application server (e.g., WildFly, Payara, TomEE).
3. A relational database (e.g., MySQL or PostgreSQL).

### Steps to Run the Project
1. **Clone the Repository:**
   ```bash
   git clone <repository-url>
   cd <repository-directory>
   ```

2. **Configure the Database:**
   - Create a database and import the provided SQL schema.
   - Update database credentials in the `persistence.xml` or configuration file.

3. **Build the Project:**
   ```bash
   mvn clean install
   ```

4. **Deploy the Application:**
   - Deploy the generated WAR file to your Jakarta EE application server.
   - Start the server.

5. **Access the Application:**
   - Open a web browser and navigate to `http://localhost:8080/<context-path>`.

## Project Structure
- **src/kz/bitlab/java:** Contains Java source files, including servlets and business logic.
- **web:** Contains JSP files, static resources (CSS, JS, images), and `WEB-INF` for configuration.
- **web/WEB_INF/lib:** Libraries (e.g., `postgresql-42.3.jar`).

## Contributions
Contributions are welcome! Please fork the repository and submit a pull request.

## License
This project is licensed under the MIT License. See the LICENSE file for details.

## Contact
For questions or feedback, please contact [Nurzhan Izimbetov/nurzhqn@gmail.com].
