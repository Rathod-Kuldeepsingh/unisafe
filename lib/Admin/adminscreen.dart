// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:unisafe/Admin/Admindashboardscreen.dart';

class AdminDashboard extends StatefulWidget {
  const AdminDashboard({super.key});

  @override
  State<AdminDashboard> createState() => _AdminDashboardState();
}

class _AdminDashboardState extends State<AdminDashboard> {
  List<Map<String, dynamic>> reports = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchReports();
  }

  Future<void> fetchReports() async {
    final supabase = Supabase.instance.client;

    final response = await supabase
        .from('incident_reports')
        .select('*')
        .order('created_at', ascending: false);

    setState(() {
      reports = response.map<Map<String, dynamic>>((report) {
        return {
          "id":report["id"]??"",
          "title": report["title"] ?? "Untitled Report",
          "description": report["description"] ?? "",
          "imageUrl": report["image_url"] ?? "",
          "location": report["location"] ?? "",
          "created_at":report["created_at"]?? "",
           "isNew": report["isNew"] ?? false,
        };
      }).toList();

      isLoading = false;
    });
  }
  Future<void> deleteReport(int index) async {
    final supabase = Supabase.instance.client;
    final report = reports[index];
    final id = report["id"];

    try {
      await supabase.from('incident_reports').delete().eq('id', id);

      setState(() {
        reports.removeAt(index);
      });

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("✅ Report deleted successfully"),
          backgroundColor: Colors.green,
        ),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("❌ Failed to delete report"),
          backgroundColor: Colors.red,
        ),
      );
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: Colors.blueAccent,
        elevation: 1,
        title: Text(
          'Admin Dashboard',
          style: GoogleFonts.inter(
              fontWeight: FontWeight.bold, color: Colors.white),
        ),
        actions: [  
          IconButton(
            icon: const Icon(Icons.notifications_none,
                color: Colors.white, size: 25),
            onPressed: () {
              
            },
          ),
          IconButton(
            icon: const Icon(Icons.person_2_outlined,
                color: Colors.white, size: 25),
            onPressed: () {
              
            },
          ),
        ],
      ),
      body: isLoading
          ? const Center(child: CircularProgressIndicator(
            color: Colors.black,
          ))
             : RefreshIndicator(
        onRefresh: fetchReports,
        child: reports.isEmpty
            ? ListView(
                children: [Center(child: Padding(
                  padding: EdgeInsets.all(20.0),
                  child: Text("No reports found."),
                ))],
              )
            : 
               ListView.builder(
                  itemCount: reports.length,
                  itemBuilder: (context, index) {
                    final report = reports[index];
                    return IncidentCard(
                      id: report["id"],
                      title: report["title"],
                      description: report["description"],
                      imageUrl: report["imageUrl"],
                      location: report["location"],
                      isNew: report["isNew"], 
                      timeAgo: report["created_at"], onDelete: () {
                         deleteReport(index); 
                       },
                    );
                  },
                ),
    ));
  }
}
