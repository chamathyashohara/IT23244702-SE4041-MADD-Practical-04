import SwiftUI

struct StudentDetailView: View {
    let student: Student

    var body: some View {
        VStack(spacing: 20) {
            Image(systemName: "person.circle.fill")
                .font(.system(size: 80))
                .foregroundStyle(.blue)

            Text(student.name)
                .font(.largeTitle)
                .bold()

            Text("Mark: \(student.mark)")
                .font(.title2)

            Text("Grade: \(student.grade)")
                .font(.title2)

            Label(student.passed ? "PASS" : "FAIL",
                  systemImage: student.passed ? "checkmark.circle.fill" : "xmark.circle.fill")
                .font(.title)
                .bold()
                .foregroundStyle(student.passed ? .green : .red)

            Spacer()
        }
        .padding()
        .navigationTitle("Student Details")
    }
}

#Preview {
    NavigationStack {
        StudentDetailView(student: Student(name: "Amal", mark: 72))
    }
}
