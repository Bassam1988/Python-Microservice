# Python-Microservice
Application Overview
This application is a robust, microservices-based platform designed for efficient video processing and conversion. Utilizing a suite of modern technologies including Python, Flask, RabbitMQ, MongoDB, MySQL, Kubernetes, and Minikube, it offers a seamless experience for converting video files to MP3 format and notifying users upon completion. The architecture is divided into four distinct microservices, each responsible for a core function, ensuring scalability, maintainability, and high availability.

Microservices Architecture
The application consists of the following microservices:

Authentication Service:

Technology Stack: Python, Flask
Functionality: Manages user authentication processes, validating credentials, and issuing JWT tokens for secure access.
Gateway Service:

Technology Stack: Python, Flask
Functionality: Serves as the entry point for all client requests. It handles routing, initiates video uploads, communicates with RabbitMQ to publish messages to the video queue, and facilitates MP3 file downloads.
Converter Service:

Technology Stack: Python
Functionality: Listens to the video queue in RabbitMQ, retrieves video files from MongoDB, processes the conversion to MP3 format, stores the MP3 files back in MongoDB, and then publishes messages to the MP3 queue.
Notification Service:

Technology Stack: Python
Functionality: Consumes messages from the MP3 queue and sends email notifications to users with the MP3 file ID, indicating that their file is ready for download.
Key Technologies
Python & Flask: Flask, a lightweight WSGI web application framework, is used to create the web interfaces of the services. Python’s simplicity and extensive library support enhance the development of complex functionalities in the services.
RabbitMQ: Facilitates asynchronous communication between services, ensuring loose coupling and efficient message handling.
MongoDB & MySQL: MongoDB is used for storing unstructured data (video and MP3 files), while MySQL manages structured data like user information.
Kubernetes & Minikube: The application is containerized and orchestrated using Kubernetes, with Minikube providing a local Kubernetes environment ideal for development and testing.
Workflow
User Authentication: Users authenticate via the Authentication Service, which grants secure access through JWT tokens.
Video Processing: Users upload videos through the Gateway Service. The service stores videos in MongoDB and places a processing request in the RabbitMQ video queue.
Conversion to MP3: The Converter Service processes the video queue, converts videos to MP3 format, and updates the data in MongoDB. Upon completion, it posts a message to the MP3 queue.
Notification and Download: The Notification Service monitors the MP3 queue and alerts users via email when their MP3 file is ready, providing the file ID for download.
Scalability and Reliability
The microservices architecture allows for independent scaling of each service based on demand, ensuring efficient resource utilization.
Kubernetes facilitates high availability, load balancing, and self-healing by automatically restarting failed containers.
RabbitMQ’s message queuing mechanism ensures that no data is lost in transit between services, even in the event of temporary service downtime.
Security
User authentication is securely managed by the Authentication Service, safeguarding against unauthorized access.
Communication between services is secured using JWT tokens, ensuring data integrity and confidentiality.
