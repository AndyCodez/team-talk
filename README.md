# TeamTalk
TeamTalk is a web application built with Ruby on Rails that enables teams to communicate and collaborate on projects. With TeamTalk, users can leave comments on a project and change its status, making it easy for teams to stay connected and work together. The application is built using Ruby on Rails and Tailwind CSS.

## Getting Started
To use TeamTalk, you will need to have Ruby, Ruby on Rails, and PostgreSQL installed on your machine. Once you have those installed, you can clone this repository to your local machine and run the following commands to set up the application:
```
# Install dependencies
$ bundle install

# Create the database
$ rails db:create

# Run database migrations
$ rails db:migrate

# Start the server
$ rails server
```
Once the server is running, you can access the application at http://localhost:3000.

## Usage
To use the application, follow these steps:

1. Sign up for an account by clicking the "Sign up" button and filling out the form.
2. Log in to your account by clicking the "Log in" button and entering your credentials.
3. Create a new project by clicking the "New Project" button on the homepage and filling out the form.
4. View the details of a project by clicking its title on the homepage.
5. Leave a comment on a project by clicking the "Add Comment" button on the project details page and filling out the form.
6. Change the status of a project by clicking the "Update Status" button on the project details page and selecting a new status from the dropdown menu.

Note: password reset functionality has not been implemented in this MVP due to the absence of an emailing feature.

## Future Todos
See the [issues](https://github.com/AndyCodez/team-talk/issues) section.

## Contributing
If you would like to contribute to TeamTalk, please submit a pull request with your changes.

## License
TeamTalk is licensed under the MIT License.
