// Scaffold(
//   appBar: AppBar(
//     title: Text('Kelola Tugas'),
//   ),
//   body: Column(
//     children: [
//       Container(
//         margin: EdgeInsets.only(top: 20),
//         child: CircleAvatar(
//           backgroundImage: AssetImage('path_to_image'), // Ganti dengan path gambar yang sesuai
//           radius: 50,
//         ),
//       ),
//       SizedBox(height: 10),
//       Text(
//         'Nama Orang',
//         style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//       ),
//       Expanded(
//         child: ListView.builder(
//           itemCount: taskList.length,
//           itemBuilder: (context, index) {
//             final task = taskList[index];
//             return ListTile(
//               title: Text(task.title),
//               subtitle: Text(task.description),
//               onTap: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                     builder: (context) => TaskDetailPage(
//                       task: task,
//                       onDelete: () {
//                         _deleteTask(task);
//                       },
//                     ),
//                   ),
//                 );
//               },
//             );
//           },
//         ),
//       ),
//     ],
//   ),
//   floatingActionButton: FloatingActionButton(
//     child: Icon(Icons.add),
//     onPressed: () {
//       // ...
//     },
//   ),
// );
