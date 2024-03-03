import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  TextEditingController _searchController = TextEditingController();
  List<String> previousSearches = ['Emma Johnson',
    'Benjamin Parker',
    'Olivia Davis',
    'Ethan Wilson',
    'Ava Miller',
    'Noah Thompson',
    'Sophia White',
    'Liam Taylor',
    'Isabella Brown',
    'Jackson Harris',
    'Tech Innovators Club',
    'Artistic Expressions Society',
    'Adventure Seekers Group',
    'Bookworms Association',
    'Fitness Enthusiasts Club',
    'Music Lovers Guild',
    'Environmental Warriors Alliance',
    'Culinary Creations Society',
    'Debate and Discussion Forum',
    'Coding Wizards Club',
    'Harmony University',
    'Quantum College of Arts and Sciences',
    'Stellar Institute of Technology',
    'Serenity University',
    'Renaissance College of Engineering',
    'Zenith Academy of Business',
    'Horizon Medical College',
    'Elysium School of Fine Arts',
    'Apex Institute of Management',
    'Celestial College of Social Sciences',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: 'Search...',
                prefixIcon: Icon(Icons.search),
                suffixIcon: IconButton(
                  icon: Icon(Icons.clear),
                  onPressed: () {
                    _searchController.clear();
                  },
                ),
                filled: true,
                fillColor: Colors.grey[200],
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
              onSubmitted: (value) {
                if (value.isNotEmpty && !previousSearches.contains(value)) {
                  setState(() {
                    previousSearches.insert(0, value);
                  });
                }
              },
            ),
            SizedBox(height: 20),
            Text(
              'Previous Searches',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black54,
              ),
            ),
            SizedBox(height: 10),
            Expanded(
              child:
              ListView.separated(
                itemCount: 5,
                separatorBuilder: (context, index) => Divider(),
                itemBuilder: (context, index) {
                  return ListTile(
                    title: TextButton(
                      onPressed: () {
                      },
                      child: Text(
                        previousSearches[index],
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    ),
                    trailing: IconButton(
                      icon: Icon(Icons.remove_circle),
                      color: Colors.red,
                      onPressed: () {
                        setState(() {
                          previousSearches.removeAt(index);
                        });
                      },
                    ),
                  );

                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}