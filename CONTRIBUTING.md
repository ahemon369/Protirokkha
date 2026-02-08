# Contributing to Protirokkha

Thank you for your interest in contributing to Protirokkha! This document provides guidelines and instructions for contributing to the project.

## 🤝 How to Contribute

### Types of Contributions

We welcome the following types of contributions:

1. **Bug Reports** - Report issues you find
2. **Feature Requests** - Suggest new features
3. **Code Contributions** - Submit pull requests
4. **Documentation** - Improve or add documentation
5. **Translations** - Help with Bengali translations
6. **Design** - Improve UI/UX
7. **Testing** - Write tests or test the app

## 🚀 Getting Started

### Prerequisites

Before you start contributing, make sure you have:

- Flutter SDK (^3.5.0) installed
- Git installed
- A GitHub account
- Basic knowledge of Dart and Flutter
- Understanding of the project structure

### Setting Up Development Environment

1. **Fork the Repository**
   ```bash
   # Click 'Fork' on GitHub
   # Then clone your fork
   git clone https://github.com/YOUR_USERNAME/Protirokkha.git
   cd Protirokkha
   ```

2. **Add Upstream Remote**
   ```bash
   git remote add upstream https://github.com/ahemon369/Protirokkha.git
   ```

3. **Install Dependencies**
   ```bash
   flutter pub get
   ```

4. **Verify Setup**
   ```bash
   flutter doctor
   flutter analyze
   ```

## 📋 Contribution Workflow

### 1. Create an Issue

Before starting work, create an issue or comment on an existing one:

- Describe the bug or feature
- Explain your proposed solution
- Wait for approval from maintainers

### 2. Create a Branch

Create a descriptive branch name:

```bash
# Feature branch
git checkout -b feature/add-chat-functionality

# Bug fix branch
git checkout -b fix/otp-timer-issue

# Documentation branch
git checkout -b docs/update-readme
```

### 3. Make Changes

Follow our coding standards:

#### Code Style

- Use `flutter format .` before committing
- Follow Dart style guide
- Add comments for complex logic
- Keep functions small and focused
- Use meaningful variable names

#### File Organization

```dart
// 1. Imports (organized)
import 'package:flutter/material.dart';          // Flutter imports
import 'package:protirokkha/app/routes.dart';   // Project imports
import '../widgets/custom_button.dart';          // Relative imports

// 2. Class definition
class MyScreen extends StatefulWidget { }

// 3. State class
class _MyScreenState extends State<MyScreen> {
  // 3a. State variables
  
  // 3b. Lifecycle methods
  
  // 3c. Build method
  
  // 3d. Helper methods
  
  // 3e. Event handlers
}
```

#### Widget Structure

```dart
Widget _buildMyWidget() {
  return Container(
    padding: const EdgeInsets.all(16),
    child: Column(
      children: [
        // Use const where possible
        const Text('Static text'),
        // Extract complex widgets
        _buildComplexWidget(),
      ],
    ),
  );
}
```

#### Bengali Text

- All user-facing text should be in Bengali
- Use proper Bengali Unicode characters
- Provide English comments for clarity

```dart
// Good
const Text('আপনার ফোন নম্বর লিখুন'), // Enter your phone number

// Avoid
const Text('Enter your phone number'),
```

### 4. Write Tests

Add tests for your changes:

```dart
// test/widget/my_widget_test.dart
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('MyWidget should display text', (tester) async {
    await tester.pumpWidget(MyWidget());
    expect(find.text('আপনার ফোন নম্বর লিখুন'), findsOneWidget);
  });
}
```

### 5. Update Documentation

If your changes affect:
- Public APIs → Update code comments
- User features → Update README.md
- Setup process → Update QUICKSTART.md
- Architecture → Update UI_IMPLEMENTATION.md

### 6. Commit Changes

Write clear commit messages:

```bash
# Good commit messages
git commit -m "feat: Add chat functionality to emergency screen"
git commit -m "fix: Resolve OTP timer countdown issue"
git commit -m "docs: Update installation instructions"
git commit -m "refactor: Extract reusable map widget"

# Commit message format
# type: subject
#
# Types:
# feat     - New feature
# fix      - Bug fix
# docs     - Documentation
# style    - Formatting, missing semicolons, etc
# refactor - Code restructuring
# test     - Adding tests
# chore    - Maintenance
```

### 7. Push and Create PR

```bash
# Push to your fork
git push origin feature/add-chat-functionality

# Create Pull Request on GitHub
# Fill in the PR template
```

## 📝 Pull Request Guidelines

### PR Title Format

```
type: Brief description

Examples:
feat: Add in-app chat between victim and defender
fix: Resolve OTP verification timer issue
docs: Update contribution guidelines
```

### PR Description Template

```markdown
## Description
Brief description of changes

## Type of Change
- [ ] Bug fix
- [ ] New feature
- [ ] Breaking change
- [ ] Documentation update

## Testing
- [ ] Tested on Android
- [ ] Tested on iOS
- [ ] Added unit tests
- [ ] Added widget tests

## Screenshots (if applicable)
Add screenshots here

## Checklist
- [ ] Code follows style guidelines
- [ ] Self-reviewed code
- [ ] Commented complex code
- [ ] Updated documentation
- [ ] No new warnings
- [ ] Added tests
- [ ] All tests pass
```

### Review Process

1. **Automated Checks**: CI/CD runs tests
2. **Code Review**: Maintainers review your code
3. **Feedback**: Address any requested changes
4. **Approval**: Once approved, PR is merged

## 🎨 Design Contributions

### UI/UX Guidelines

When contributing designs:

1. **Follow Material 3** design principles
2. **Use the color palette**:
   - Primary: `#D32F2F`
   - Secondary: `#388E3C`
   - Background: `#F5F5F5`
3. **Maintain consistency** with existing screens
4. **Use Bengali text** for labels
5. **Consider accessibility** (contrast, touch targets)

### Design Tools

Recommended tools:
- Figma
- Adobe XD
- Sketch

### Submitting Designs

1. Create mockups in design tool
2. Export as PNG/PDF
3. Create issue with designs attached
4. Discuss with maintainers

## 🌐 Translation Contributions

### Bengali Translations

Help improve Bengali text:

1. Find English text or poor Bengali translation
2. Suggest better Bengali translation
3. Provide context and reasoning
4. Submit PR with changes

### Example

```dart
// Before
const Text('অ্যাকাউন্ট সেটআপ'), // Direct transliteration

// After (Better Bengali)
const Text('হিসাব তৈরি করুন'), // Natural Bengali
```

## 🐛 Bug Reports

### Before Reporting

1. Check if issue already exists
2. Verify it's reproducible
3. Test on latest version

### Bug Report Template

```markdown
**Describe the bug**
Clear description of the bug

**To Reproduce**
Steps to reproduce:
1. Go to '...'
2. Click on '...'
3. See error

**Expected behavior**
What should happen

**Screenshots**
Add screenshots if applicable

**Device Info**
- Device: [e.g. Pixel 5]
- OS: [e.g. Android 12]
- App Version: [e.g. 1.0.0]

**Additional context**
Any other information
```

## ✨ Feature Requests

### Before Requesting

1. Check if feature already requested
2. Consider if it fits project goals
3. Think about implementation

### Feature Request Template

```markdown
**Is your feature request related to a problem?**
Describe the problem

**Describe the solution you'd like**
Clear description of desired feature

**Describe alternatives considered**
Other solutions you considered

**Additional context**
Mockups, examples, etc.
```

## 📚 Documentation Contributions

### What Needs Documentation

- New features
- API changes
- Setup instructions
- Troubleshooting guides
- Code examples

### Documentation Style

- Use clear, simple language
- Provide code examples
- Add screenshots where helpful
- Keep it up-to-date

## 🧪 Testing Contributions

### Writing Tests

```dart
// Unit tests
test('parsePhoneNumber returns correct format', () {
  expect(parsePhoneNumber('1234567890'), '+881234567890');
});

// Widget tests
testWidgets('SOS button is visible', (tester) async {
  await tester.pumpWidget(HomeScreen());
  expect(find.byType(SosButton), findsOneWidget);
});
```

### Running Tests

```bash
# All tests
flutter test

# Specific test
flutter test test/widget/sos_button_test.dart

# With coverage
flutter test --coverage
```

## 🔍 Code Review Guidelines

### For Contributors

When your PR is reviewed:
- Respond to feedback promptly
- Be open to suggestions
- Ask questions if unclear
- Make requested changes

### For Reviewers

When reviewing PRs:
- Be respectful and constructive
- Explain reasoning for changes
- Approve good contributions quickly
- Help improve the code

## 🏆 Recognition

Contributors will be:
- Listed in AUTHORS.md
- Mentioned in release notes
- Credited in app about section

## 📧 Communication

### Channels

- **GitHub Issues** - Bug reports, feature requests
- **Pull Requests** - Code discussions
- **Discussions** - General questions

### Response Times

- Issues: Within 2-3 days
- PRs: Within 3-5 days
- Critical bugs: Within 24 hours

## ❓ Questions?

If you have questions:

1. Check existing documentation
2. Search closed issues
3. Ask in GitHub Discussions
4. Open a new issue with question label

## 📜 Code of Conduct

### Our Pledge

We are committed to providing a welcoming and inspiring community for all.

### Our Standards

- Use welcoming and inclusive language
- Be respectful of differing viewpoints
- Accept constructive criticism gracefully
- Focus on what is best for the community

### Unacceptable Behavior

- Harassment or discrimination
- Trolling or insulting comments
- Publishing private information
- Unprofessional conduct

### Enforcement

Violations may result in:
1. Warning
2. Temporary ban
3. Permanent ban

Report violations to: conduct@protirokkha.com

## 📄 License

By contributing, you agree that your contributions will be licensed under the MIT License.

## 🙏 Thank You!

Your contributions make Protirokkha better for everyone. Whether you're fixing a typo or adding a major feature, every contribution matters!

---

Happy Contributing! 🚀

**Maintainers**: @ahemon369
**Last Updated**: February 2026
