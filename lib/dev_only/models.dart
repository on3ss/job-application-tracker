import 'dart:collection';

enum ScoreType {
  gpa,
  percentage,
  absolute,
}

/// Represents a job application.
class JobApplication {
  final int id;
  final String title;
  final String description;
  final DateTime applicationDate;
  final String appliedOn;
  final String? link;
  final UnmodifiableListView<JobApplicationStage> stages;

  JobApplication({
    required this.id,
    required this.title,
    required this.description,
    required this.applicationDate,
    required this.appliedOn,
    this.link,
    List<JobApplicationStage> stages = const [],
  }) : stages = UnmodifiableListView(stages);

  /// Adds a new stage to the job application.
  JobApplication addStage(JobApplicationStage stage) {
    return JobApplication(
      id: id,
      title: title,
      description: description,
      applicationDate: applicationDate,
      appliedOn: appliedOn,
      link: link,
      stages: [...stages, stage],
    );
  }

  /// Removes a stage from the job application.
  JobApplication removeStage(int stageId) {
    return JobApplication(
      id: id,
      title: title,
      description: description,
      applicationDate: applicationDate,
      appliedOn: appliedOn,
      link: link,
      stages: stages.where((stage) => stage.id != stageId).toList(),
    );
  }

  /// Updates an existing stage in the job application.
  JobApplication updateStage(JobApplicationStage updatedStage) {
    return JobApplication(
      id: id,
      title: title,
      description: description,
      applicationDate: applicationDate,
      appliedOn: appliedOn,
      link: link,
      stages: stages
          .map((stage) => stage.id == updatedStage.id ? updatedStage : stage)
          .toList(),
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is JobApplication &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          title == other.title &&
          description == other.description &&
          applicationDate == other.applicationDate &&
          appliedOn == other.appliedOn &&
          link == other.link &&
          stages == other.stages;

  @override
  int get hashCode =>
      id.hashCode ^
      title.hashCode ^
      description.hashCode ^
      applicationDate.hashCode ^
      appliedOn.hashCode ^
      link.hashCode ^
      stages.hashCode;
}

/// Represents a stage in the job application process.
class JobApplicationStage {
  final int id;
  final int jobApplicationID;
  final String name;
  final String description;
  final DateTime on;
  final List<String> subjects;
  final bool isDone;
  final JobApplicationStageResult? result;

  JobApplicationStage({
    required this.id,
    required this.name,
    required this.description,
    required this.on,
    required this.subjects,
    required this.jobApplicationID,
    this.isDone = false,
    this.result,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is JobApplicationStage &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          jobApplicationID == other.jobApplicationID &&
          name == other.name &&
          description == other.description &&
          on == other.on &&
          subjects == other.subjects &&
          isDone == other.isDone &&
          result == other.result;

  @override
  int get hashCode =>
      id.hashCode ^
      jobApplicationID.hashCode ^
      name.hashCode ^
      description.hashCode ^
      on.hashCode ^
      subjects.hashCode ^
      isDone.hashCode ^
      result.hashCode;
}

class JobApplicationStageResult {
  final int stageID;
  final bool isPassed;
  final ScoreType scoreType;
  final double score;
  final int? maxScore; // Only applicable if scoreType is absolute

  JobApplicationStageResult({
    required this.stageID,
    required this.isPassed,
    required this.scoreType,
    required this.score,
    this.maxScore,
  }) : assert(
          (scoreType == ScoreType.absolute && maxScore != null) ||
              scoreType != ScoreType.absolute,
          'maxScore is required when scoreType is absolute',
        );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is JobApplicationStageResult &&
          runtimeType == other.runtimeType &&
          stageID == other.stageID &&
          isPassed == other.isPassed &&
          scoreType == other.scoreType &&
          score == other.score &&
          maxScore == other.maxScore;

  @override
  int get hashCode =>
      stageID.hashCode ^
      isPassed.hashCode ^
      scoreType.hashCode ^
      score.hashCode ^
      maxScore.hashCode;
}
