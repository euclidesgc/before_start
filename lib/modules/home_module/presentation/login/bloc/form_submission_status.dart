abstract class FormSubmissionStatus {
  const FormSubmissionStatus();
}

class InitialFormStatus extends FormSubmissionStatus {
  const InitialFormStatus();
}

class FormSubmitting extends FormSubmissionStatus {
  const FormSubmitting();
}

class SubmissionSuccess extends FormSubmissionStatus {
  const SubmissionSuccess();
}

class SubmissionFailed extends FormSubmissionStatus {
  final Exception? exception;

  const SubmissionFailed(this.exception);
}
