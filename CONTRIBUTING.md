# Contributing to opensilex-docker-compose

Thank you for your interest in contributing to opensilex-docker-compose! We appreciate all contributions, whether they're code improvements, documentation updates, bug reports, feature requests, or anything else. Here's how you can help:

## Guidelines

### Questions Before Contributing

If you have a question about the project, consider opening an issue first to discuss it. This ensures that others can weigh in and provides a centralized place for discussion.

### Ground Rules

- Be welcoming to newcomers and encourage diverse points of view and experiences.
- Keep discussions constructive and positive.
- Communicate openly and honestly.

### Your First Contribution

Unsure where to begin? You can start by looking through the `Issues` tab to find tasks labeled as `good first issue`.

### Reporting Bugs

Report bugs by opening an issue with ``bug template``. Please provide details like the error message, environment, and steps to reproduce the problem.

### Suggesting Enhancements

Enhancement suggestions are tracked as GitLab issues. Create an issue to propose a new feature or improvement.

### Merge Request Process

1. Fork the Project
2. Create a branch (`git checkout -b branch-name`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin branch-name`)
5. Open a Merge Request

#### Note: Always write a clear log message for your commits. One-line messages are fine for small changes, but larger changes should look like this:

```
Short (50 chars or less) summary of changes

More detailed explanatory text, if necessary. Wrap it to about 72 characters or so.

Further paragraphs come after blank lines.

- Bullet points are okay, too

- Explain the problem the change addresses and why it's needed
- Explain the change you've made
- Mention any dependencies you've changed or added
- Explain users of older environments or database schema changes
- Explain places you believe the code will affect
- Explain other effects of this MR

## Setup

Ensure you have Docker and Docker Compose installed on your machine. Refer to the official Docker documentation for installation instructions.

### Local Setup

Follow the setup instructions in the [README.md](README.md) to get the project running locally.

### Making Changes

- Create a named branch for your changes (`git checkout -b my-feature-branch`)
- Make commits of logical units of work; no half-done work.
- Use a descriptive commit message.

```sh
git commit -m "Adds feature X"
```

### Building and Testing

After making changes, ensure your code runs successfully with
```bash
docker compose --env-file opensilex.env build --build-arg UID=$(id -u) --build-arg GID=$(id -g)
docker compose --env-file opensilex.env up start_opensilex_stack -d
```
and passes any existing tests.

## Submitting Changes

Open a Merge Request with a clear `title` and `description`. Explain what you did and why.

## Our Standards

- **Have fun!** 🎉
```

Remember, the goal of the project is to make it easy for anyone to contribute. Let's keep things friendly and professional!

---

Feel free to modify this template to fit your project's specifics, such as specific setup instructions, testing frameworks, or additional guidelines you'd like contributors to follow.

---

## Additional Notes

Contributions are what make open-source projects thrive. Thank you for being interested in contributing to opensilex-docker-compose!

## Guide to Contributing

To contribute to opensilex-docker-compose, follow these steps:

### Step 1: Fork the Project

Fork this repository to your GitLab account.

### Step 2: Clone the Repository

Clone your forked repository to your local machine:

```sh
git clone https://forgemia.inra.fr/OpenSILEX/opensilex-docker-compose.git
cd opensilex-docker-compose
```

### Step 3: Make Changes

Make your changes in a new git branch:

```sh
git checkout -b my-feature-branch
```

### Step 4: Build and Test Locally

Ensure your changes don't break the build. If there are tests, run them:

```bash
docker compose --env-file opensilex.env build --build-arg UID=$(id -u) --build-arg GID=$(id -g)
```

### Step 5: Commit Changes

Commit your changes:

```sh
git commit -m "Your detailed description of your changes."
```

### Step 6: Push Changes

Push your changes to GitLab:

```sh
git push origin my-feature-branch
```

### Step 7: Open a Merge Request

Create a merge request against the main branch.

### Our Standards

- **Do not** rebase your branch off `main`.
- **Include screenshots of the UI and save them in the GitLab repository.

### Additional Resources

- Docker Documentation
- Docker Best Practices
