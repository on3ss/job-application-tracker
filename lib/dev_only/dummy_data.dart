import 'package:faker/faker.dart';
import 'models.dart';

// Generate dummy JobApplicationStageResult
JobApplicationStageResult generateStageResult(int stageID) {
  var faker = Faker();
  var scoreType = faker.randomGenerator.element(ScoreType.values);

  return JobApplicationStageResult(
    stageID: stageID,
    isPassed: faker.randomGenerator.boolean(),
    scoreType: scoreType,
    score: scoreType == ScoreType.gpa
        ? faker.randomGenerator.decimal(min: 0, scale: 4.0)
        : faker.randomGenerator.decimal(min: 0, scale: 100.0),
    maxScore: scoreType == ScoreType.absolute
        ? faker.randomGenerator.integer(100, min: 60)
        : null,
  );
}

// Generate dummy JobApplicationStage
JobApplicationStage generateStage(int jobApplicationID) {
  var faker = Faker();
  return JobApplicationStage(
    id: faker.randomGenerator.integer(1000, min: 1),
    jobApplicationID: jobApplicationID,
    name: faker.job.title(),
    description: faker.lorem.sentence(),
    on: faker.date.dateTime(),
    subjects: List<String>.generate(3, (_) => faker.lorem.word()),
    isDone: faker.randomGenerator.boolean(),
    result: generateStageResult(faker.randomGenerator.integer(1000, min: 1)),
  );
}

// Generate dummy JobApplication
JobApplication generateApplication() {
  var faker = Faker();
  var id = faker.randomGenerator.integer(1000, min: 1);
  return JobApplication(
    id: id,
    title: faker.job.title(),
    description: faker.lorem.sentence(),
    applicationDate: faker.date.dateTime(),
    appliedOn: faker.company.name(),
    link: faker.internet.httpsUrl(),
    stages: List.generate(
      faker.randomGenerator.integer(5, min: 1),
      (_) => generateStage(id),
    ),
  );
}

// Generate a list of dummy JobApplications
List<JobApplication> generateApplications(int count) {
  return List.generate(count, (_) => generateApplication());
}
