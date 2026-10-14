import SwiftUI

struct ContentView: View {
    @State private var students: [Student] = []
    @State private var studentName = ""
    @State private var markText = ""

    var passedCount: Int {
        students.filter { $0.passed }.count
    }

    var body: some View {
        NavigationStack {
            VStack {
                TextField("Student Name", text: $studentName)
                    .textFieldStyle(.roundedBorder)

                TextField("Mark", text: $markText)
                    .textFieldStyle(.roundedBorder)
                    .keyboardType(.numberPad)

                Button("Add Student") {
                    addStudent()
                }
                .buttonStyle(.borderedProminent)

                Text("Passed Students: \(passedCount)")
                    .font(.headline)
                    .padding(.top)

                List(students) { student in
                    NavigationLink {
                        StudentDetailView(student: student)
                    } label: {
                        HStack {
                            Text(student.name)
                            Spacer()
                            Text("\(student.mark) (\(student.passed ? "Pass" : "Fail"))")
                                .bold()
                                .foregroundStyle(student.passed ? .green : .red)
                        }
                    }
                }
            }
            .padding()
            .navigationTitle("SE4041 Marks")
        }
    }

    func addStudent() {
        let name = studentName.trimmingCharacters(in: .whitespaces)

        guard !name.isEmpty else { return }
        guard let mark = Int(markText) else { return }
        guard mark >= 0 && mark <= 100 else { return }

        students.append(Student(name: name, mark: mark))

        studentName = ""
        markText = ""
    }
}

#Preview {
    ContentView()
}
