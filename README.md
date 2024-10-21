# Insecure Phoenix

![alt text](insecure_phoenix.webp)
**Insecure Phoenix** is a deliberately vulnerable Phoenix application designed to demonstrate various web security vulnerabilities, including but not limited to HTTP header injection and session misconfigurations. The goal of this project is to provide a hands-on educational environment for learning about security flaws and how to mitigate them in Phoenix and Elixir-based applications.

## Purpose

This application contains intentionally introduced security flaws to help developers and security professionals:

- Understand common vulnerabilities in web applications.
- Practice finding and mitigating these vulnerabilities in Phoenix applications.
- Test security tools or static analysis checkers.

## Features

The application is designed to showcase vulnerabilities such as:

- **HTTP Header Injection**: Unsanitized user input injected into HTTP headers can lead to security issues like cookie manipulation and request smuggling.
- **Session Fixation**: Misconfigured session handling that can allow session fixation attacks.
- **Sensitive Data Exposure**: Insecure logging of sensitive information such as passwords or tokens.
- **Improper Session Management**: Missing session renewal or encryption, leading to potential session hijacking.
- **Other Common Vulnerabilities**: Potential for SQL injections, XSS, and CSRF if further extended.

## Vulnerabilities Demonstrated

### 1. HTTP Header Injection
A common attack vector where unsanitized user input is injected into HTTP headers, potentially allowing attackers to manipulate headers like `Set-Cookie`.

### 2. Session Fixation
An improperly configured session that doesn't renew or properly secure session cookies can be exploited by attackers to hijack a session.

### 3. Sensitive Data Logging
Logging sensitive data such as passwords or API tokens can expose critical information if logs are compromised.

## Installation

To get started with **Insecure Phoenix**, follow these steps:

1. **Clone the repository**:

   ```bash
   git clone https://github.com/yourusername/insecure-phoenix.git
   cd insecure-phoenix
   ```

2. **Install dependencies**:

   ```bash
   mix deps.get
   ```

3. **Set up the database** (if needed):

   ```bash
   mix ecto.setup
   ```

4. **Start the application**:

   ```bash
   mix phx.server
   ```

   The application should now be running on `http://localhost:4000`.


## Disclaimer

**This application is for educational purposes only.** Do not deploy this application in a production environment. It is intentionally vulnerable and should be used only in controlled environments to learn about security issues and their remediation.

## Contributing

If you'd like to contribute to the project, feel free to submit pull requests or open issues for new vulnerabilities or improvements.

