import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  runApp(TaskManagerApp());
}

class TaskManagerApp extends StatelessWidget {
  const TaskManagerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Kelola Tugas',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Task> taskList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue,
      appBar: AppBar(
        title: Text('Kelola Tugas'),
      ),
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.only(top: 20),
            child: CircleAvatar(
              backgroundImage: AssetImage('../assets/images/ariel.jpeg'),
              radius: 75.0,
            ),
          ),
          Text(
            'Ariel Caturputra Kalew',
            style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontFamily: 'Roboto'),
          ),
          Text(
            '2009116011',
            style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w600,
                color: Colors.lightBlue.shade100,
                fontFamily: 'Roboto'),
          ),
          Divider(
            color: Colors.lightBlue.shade100,
            height: 20.0,
            thickness: 1.0,
            indent: 80,
            endIndent: 80,
          ),
          Text(
            'Daftar Tugas:',
            style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.normal,
                color: Colors.lightBlue.shade100,
                fontFamily: 'Roboto'),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: taskList.length,
              itemBuilder: (context, index) {
                final task = taskList[index];
                return ListTile(
                  title: Text(
                    task.title,
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                  subtitle: Text(task.description,
                      style: TextStyle(
                        color: Colors.lightBlue.shade100,
                      )),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => TaskDetailPage(
                          task: task,
                          onDelete: () {
                            _deleteTask(task);
                          },
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.white,
        child: Icon(Icons.add, color: Colors.blue),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AddTaskPage(
                onTaskAdded: (newTask) {
                  setState(() {
                    taskList.add(newTask);
                  });
                },
              ),
            ),
          );
        },
      ),
    );
  }

  void _deleteTask(Task task) {
    setState(() {
      taskList.remove(task);
    });
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Task deleted')),
    );
  }
}

class AddTaskPage extends StatelessWidget {
  final Function(Task) onTaskAdded;

  AddTaskPage({required this.onTaskAdded});

  @override
  Widget build(BuildContext context) {
    String title = '';
    String description = '';

    return Scaffold(
      appBar: AppBar(
        title: Text('Tambah Tugas'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              onChanged: (value) {
                title = value;
              },
              decoration: InputDecoration(
                labelText: 'Title',
              ),
            ),
            SizedBox(height: 16.0),
            TextField(
              onChanged: (value) {
                description = value;
              },
              decoration: InputDecoration(
                labelText: 'Description',
              ),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                final newTask = Task(title: title, description: description);
                onTaskAdded(newTask);
                Navigator.pop(context);
              },
              child: Text('Save'),
            ),
          ],
        ),
      ),
    );
  }
}

class TaskDetailPage extends StatefulWidget {
  final Task task;
  final Function onDelete;

  TaskDetailPage({required this.task, required this.onDelete});

  @override
  _TaskDetailPageState createState() => _TaskDetailPageState();
}

class _TaskDetailPageState extends State<TaskDetailPage> {
  int index = Random().nextInt(10);

  List<String> quotes = [
    "Aku rindu menyelesaikan pekerjaan besar dan mulia, tapi tugas utamaku adalah untuk menyelesaikan pekerjaan kecil seakan itu pekerjaan besar dan mulia.",
    "Tugas besar kita bukanlah melihat sesuatu yang berkilau dari kejauhan tetapi melakukan sesuatu terhadap apa yang ada di tangan.",
    "Tugas atau posisi yang diemban bukan untuk dibanggakan, tapi untuk dipertanggung jawabkan.",
    "Jangan patah semangat, karena Tuhan akan selalu memberi waktu dan kesempatan. Tugas kita adalah berusaha semampu yang kita bisa.",
    "Jangan sampai terlalu sibuk dengan deadline tugas, hingga lupa bahwa deadline hidup kita bisa berakhir sekarang juga, detik ini juga.",
    "Tidak ada yang benar-benar sulit jika Anda membaginya menjadi tugas-tugas kecil.",
    "Lakukan sesuatu yang tidak anda sukai setiap hari, inilah peraturan dasar untuk mendapatkan kebiasaan melakukan tugas anda tanpa rasa sakit.",
    "Tugas di hadapanmu tidak pernah lebih besar ketimbang kekuatan di belakangmu.",
    "Tidak ada yang begitu melelahkan selain bergantung pada tugas yang belum selesai.",
    "Jika suatu tugas telah dimulai, jangan pernah meninggalkannya sampai selesai.",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail Tugas'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '${widget.task.title}',
              style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue),
            ),
            SizedBox(height: 8.0),
            Text('${widget.task.description}',
                style: TextStyle(color: Colors.lightBlue)),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                _showDeleteConfirmationDialog(context);
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.red),
              ),
              child: Text('Delete'),
            ),
            SizedBox(height: 16.0),
            Divider(
              color: Colors.black,
              height: 20.0,
              thickness: 1.0,
              indent: 1.0,
              endIndent: 1.0,
            ),
            Expanded(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Motivasi Harian:',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue),
                    ),
                    Text(
                      '"${quotes[index % quotes.length]}"',
                      style: TextStyle(fontSize: 16, color: Colors.lightBlue),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showDeleteConfirmationDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Delete Task'),
          content: Text('Are you sure you want to delete this task?'),
          actions: [
            TextButton(
              child: Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text('Delete'),
              onPressed: () {
                widget.onDelete();
                Navigator.of(context).pop();
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Task deleted')),
                );
              },
            ),
          ],
        );
      },
    );
  }
}

class Task {
  final String title;
  final String description;

  Task({required this.title, required this.description});
}
