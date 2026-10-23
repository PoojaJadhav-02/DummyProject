import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../theme/rtw_colors.dart';
import '../theme/rtw_typography.dart';
import '../widgets/account_field.dart';
import '../widgets/brand_header.dart';
import '../widgets/gender_selector.dart';
import '../widgets/glass_surface.dart';
import '../widgets/primary_action_button.dart';
import '../widgets/rtw_status_bar.dart';
import '../widgets/rtw_svg_icon.dart';

/// Create-account step from RTW frame `800:892` (412 × 917, radius 52).
///
/// A second status bar exists in the file at y = -36. The frame clips it, so
/// it is not painted here.
class CreateAccountScreen extends StatefulWidget {
  const CreateAccountScreen({super.key});

  @override
  State<CreateAccountScreen> createState() => _CreateAccountScreenState();
}

class _CreateAccountScreenState extends State<CreateAccountScreen> {
  final _firstName = TextEditingController();
  final _lastName = TextEditingController();
  final _email = TextEditingController();
  final _password = TextEditingController();
  final _confirmPassword = TextEditingController();

  final _firstNameFocus = FocusNode();
  final _lastNameFocus = FocusNode();
  final _emailFocus = FocusNode();
  final _passwordFocus = FocusNode();
  final _confirmFocus = FocusNode();

  late final TapGestureRecognizer _termsRecognizer;
  late final TapGestureRecognizer _privacyRecognizer;
  late final TapGestureRecognizer _loginRecognizer;

  Gender _gender = Gender.male;
  bool _hidePassword = true;
  bool _hideConfirm = true;

  @override
  void initState() {
    super.initState();
    _termsRecognizer = TapGestureRecognizer()..onTap = _onTerms;
    _privacyRecognizer = TapGestureRecognizer()..onTap = _onPrivacy;
    _loginRecognizer = TapGestureRecognizer()..onTap = _onLogin;
  }

  @override
  void dispose() {
    _firstName.dispose();
    _lastName.dispose();
    _email.dispose();
    _password.dispose();
    _confirmPassword.dispose();
    _firstNameFocus.dispose();
    _lastNameFocus.dispose();
    _emailFocus.dispose();
    _passwordFocus.dispose();
    _confirmFocus.dispose();
    _termsRecognizer.dispose();
    _privacyRecognizer.dispose();
    _loginRecognizer.dispose();
    super.dispose();
  }

  void _onTerms() {}

  void _onPrivacy() {}

  void _onLogin() {}

  void _onNext() {
    FocusScope.of(context).unfocus();
  }

  void _focus(FocusNode node) => node.requestFocus();

  void _setGender(Gender gender) {
    setState(() => _gender = gender);
  }

  void _togglePassword() {
    setState(() => _hidePassword = !_hidePassword);
  }

  void _toggleConfirm() {
    setState(() => _hideConfirm = !_hideConfirm);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      resizeToAvoidBottomInset: false,
      body: Stack(
        clipBehavior: Clip.none,
        // clipBehavior: Clip.hardEdge,
        children: [
          // const Positioned(
          //   left: 5,
          //   top: 5,
          //   width: 402,
          //   height: 48,
          //   child: RtwStatusBar(),
          // ),
          Positioned(
            left: 6,
            right: 6,
            top: 0,
            height: 68,
            child: BrandHeader(onBack: () => Navigator.of(context).maybePop()),
          ),
          Positioned(
            left: 0,
            right: 0,
            top: 68,
            bottom: 0,
            child: _AccountCreation(state: this),
          ),
        ],
      ),
    );
  }
}

class _AccountCreation extends StatelessWidget {
  const _AccountCreation({required this.state});

  final _CreateAccountScreenState state;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final contentWidth = _glassWidth(constraints.maxWidth);
        final side = (constraints.maxWidth - contentWidth) / 2;

        return Padding(
          padding: EdgeInsets.fromLTRB(side, 16, side, 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: FittedBox(
                  fit: BoxFit.scaleDown,
                  alignment: Alignment.topCenter,
                  child: SizedBox(
                    width: contentWidth,
                    child: Column(
                      spacing: 18,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        const _Introduction(),
                        _GlassForm(state: state),
                        _Actions(state: state),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                'PEOPLE  ·  PLANET  ·  PURPOSE  ·  TOGETHER',
                textAlign: TextAlign.center,
                style: RtwType.footer,
              ),
            ],
          ),
        );
      },
    );
  }

  /// Phone cards sit close to the screen edges. Larger windows keep the
  /// glass wide, then stop stretching it across the whole display.
  double _glassWidth(double maxWidth) {
    if (maxWidth >= 1200) return 760;
    if (maxWidth >= 840) return 680;
    if (maxWidth >= 600) return maxWidth - 32;
    return maxWidth - 16;
  }
}

class _Introduction extends StatelessWidget {
  const _Introduction();

  @override
  Widget build(BuildContext context) {
    return const Column(
      spacing: 12,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: double.infinity,
          child: Text('Step 1 of 2', style: RtwType.step),
        ),
        Text.rich(
          TextSpan(
            style: RtwType.headline,
            children: [
              TextSpan(text: 'Create your\n'),
              TextSpan(
                text: 'account',
                style: TextStyle(color: RtwColors.green),
              ),
              TextSpan(
                text: '.',
                style: TextStyle(color: RtwColors.mint),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _GlassForm extends StatelessWidget {
  const _GlassForm({required this.state});

  final _CreateAccountScreenState state;

  @override
  Widget build(BuildContext context) {
    return GlassSurface(
      radius: 26,
      fill: RtwColors.white16,
      border: RtwColors.white16,
      kind: GlassKind.panel,
      padding: const EdgeInsets.all(18),
      child: Column(
        spacing: 14,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            spacing: 12,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: AccountField(
                  label: 'First Name',
                  hint: 'First name',
                  controller: state._firstName,
                  focusNode: state._firstNameFocus,
                  textCapitalization: TextCapitalization.words,
                  textInputAction: TextInputAction.next,
                  autofillHints: const [AutofillHints.givenName],
                  onSubmitted: (_) => state._focus(state._lastNameFocus),
                ),
              ),
              Expanded(
                child: AccountField(
                  label: 'Last Name',
                  hint: 'Last name',
                  controller: state._lastName,
                  focusNode: state._lastNameFocus,
                  textCapitalization: TextCapitalization.words,
                  textInputAction: TextInputAction.next,
                  autofillHints: const [AutofillHints.familyName],
                  onSubmitted: (_) => state._focus(state._emailFocus),
                ),
              ),
            ],
          ),
          AccountField(
            label: 'Email Address',
            hint: 'Enter your email address',
            controller: state._email,
            focusNode: state._emailFocus,
            keyboardType: TextInputType.emailAddress,
            textInputAction: TextInputAction.next,
            autofillHints: const [AutofillHints.email],
            onSubmitted: (_) => state._focus(state._passwordFocus),
            prefix: const RtwSvgIcon(RtwAssets.mail, width: 17, height: 17),
          ),
          GenderSelector(value: state._gender, onChanged: state._setGender),
          AccountField(
            label: 'Password',
            hint: 'Create a strong password',
            helper: 'At least 8 characters with letters, numbers and a special character',
            controller: state._password,
            focusNode: state._passwordFocus,
            obscureText: state._hidePassword,
            textInputAction: TextInputAction.next,
            autofillHints: const [AutofillHints.newPassword],
            onSubmitted: (_) => state._focus(state._confirmFocus),
            prefix: const RtwSvgIcon(RtwAssets.lock, width: 17, height: 17),
            suffix: _VisibilityToggle(
              key: const Key('password-visibility'),
              hidden: state._hidePassword,
              onTap: state._togglePassword,
            ),
          ),
          AccountField(
            label: 'Confirm Password',
            hint: 'Confirm your password',
            controller: state._confirmPassword,
            focusNode: state._confirmFocus,
            obscureText: state._hideConfirm,
            textInputAction: TextInputAction.done,
            autofillHints: const [AutofillHints.newPassword],
            onSubmitted: (_) => state._onNext(),
            prefix: const RtwSvgIcon(RtwAssets.lock, width: 17, height: 17),
            suffix: _VisibilityToggle(
              key: const Key('confirm-visibility'),
              hidden: state._hideConfirm,
              onTap: state._toggleConfirm,
            ),
          ),
        ],
      ),
    );
  }
}

class _VisibilityToggle extends StatelessWidget {
  const _VisibilityToggle({
    required this.hidden,
    required this.onTap,
    super.key,
  });

  final bool hidden;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Semantics(
      button: true,
      label: hidden ? 'Show password' : 'Hide password',
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: onTap,
        child: RtwSvgIcon(
          hidden ? RtwAssets.eyeOff : RtwAssets.eye,
          width: 17,
          height: 17,
        ),
      ),
    );
  }
}

class _Actions extends StatelessWidget {
  const _Actions({required this.state});

  final _CreateAccountScreenState state;

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 14,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        PrimaryActionButton(label: 'Next', onPressed: state._onNext),
        Text.rich(
          TextSpan(
            style: RtwType.legal,
            children: [
              const TextSpan(
                text: 'By creating an account, you agree to our\n',
              ),
              TextSpan(
                text: 'Terms of Service',
                style: RtwType.legalLink,
                recognizer: state._termsRecognizer,
              ),
              const TextSpan(text: ' and '),
              TextSpan(
                text: 'Privacy Policy.',
                style: RtwType.legalLink,
                recognizer: state._privacyRecognizer,
              ),
            ],
          ),
          textAlign: TextAlign.center,
        ),
        Text.rich(
          TextSpan(
            style: RtwType.login,
            children: [
              const TextSpan(text: 'Already have an account? '),
              TextSpan(
                text: 'Log in',
                style: RtwType.loginLink,
                recognizer: state._loginRecognizer,
              ),
            ],
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}