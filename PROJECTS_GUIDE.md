# 📁 Projects & Images Management Guide

## 🖼️ **Adding Images**

### **Image Structure**
```
assets/
├── images/
│   ├── profile/
│   │   └── profile.jpg          # Your profile photo
│   └── projects/
│       ├── nosh/                # Nosh Robotics projects
│       │   ├── cooking_robot.jpg
│       │   ├── pcb_testing.jpg
│       │   └── wire_harness.jpg
│       ├── automation/          # Automation projects
│       │   ├── lockbox.jpg
│       │   ├── green_valley.jpg
│       │   ├── agriculture_robot.jpg
│       │   └── ladoo_machine.jpg
│       ├── electronics/         # Electronics projects
│       │   └── pcb_design.jpg
│       └── mechanical/          # Mechanical projects
│           ├── 3d_printer.jpg
│           └── cnc_machine.jpg
```

### **How to Add Images**
1. **Place your image** in the appropriate folder
2. **Replace the dummy file** (e.g., `touch` created files)
3. **Use the same filename** as referenced in the code
4. **Recommended format**: JPG or PNG, optimized for web (max 500KB)

## ➕ **Adding New Projects**

### **Featured Projects**
Edit `lib/screens/projects_screen.dart` and add to the `featuredProjects` list:

```dart
List<Project> get featuredProjects => [
  // ... existing projects ...
  
  const Project(
    title: 'Your New Project',
    company: 'Company Name',
    description: 'Project description here...',
    technologies: ['Tech1', 'Tech2', 'Tech3'],
    imagePath: 'assets/images/projects/category/project_image.jpg',
    color: Color(0xFF9F7AEA), // Choose a color
    icon: Icons.your_icon,    // Choose an icon
  ),
];
```

### **Recent Projects**
Add to the `recentProjects` list:

```dart
List<Project> get recentProjects => [
  // ... existing projects ...
  
  const Project(
    title: 'Another Project',
    company: 'Client/Company',
    description: 'Description...',
    technologies: ['Tech1', 'Tech2'],
    imagePath: 'assets/images/projects/category/project.jpg',
    color: Color(0xFF38B2AC),
    icon: Icons.another_icon,
  ),
];
```

### **Project Categories**
Update the `projectCategories` list:

```dart
List<Map<String, dynamic>> get projectCategories => [
  // ... existing categories ...
  
  {
    'title': 'New Category',
    'count': '5',
    'description': 'Description of this category',
    'icon': Icons.new_icon,
    'color': const Color(0xFFF56565),
  },
];
```

### **Project Statistics**
Update the `projectStats` list:

```dart
List<Map<String, dynamic>> get projectStats => [
  // ... existing stats ...
  
  {
    'value': 'New Value',
    'label': 'New Label',
    'icon': Icons.new_icon,
    'color': const Color(0xFF38B2AC),
  },
];
```

## 🎨 **Customization Options**

### **Colors**
Use any Flutter color or hex values:
```dart
color: Color(0xFF667EEA),  // Blue
color: Color(0xFF48BB78),  // Green
color: Color(0xFFED8936),  // Orange
color: Color(0xFF9F7AEA),  // Purple
color: Color(0xFFF56565),  // Red
color: Color(0xFF38B2AC),  // Teal
```

### **Icons**
Choose from Flutter's built-in icons:
```dart
icon: Icons.restaurant,      // Food/Restaurant
icon: Icons.memory,          // Electronics
icon: Icons.electric_bolt,   // Power/Energy
icon: Icons.lock,            // Security
icon: Icons.factory,         // Industrial
icon: Icons.agriculture,     // Agriculture
icon: Icons.cake,            // Food
icon: Icons.print,           // 3D Printing
icon: Icons.precision_manufacturing, // Manufacturing
icon: Icons.science,         // Testing/Research
icon: Icons.smart_toy,       // Automation
icon: Icons.lightbulb,       // Innovation
```

## 📱 **Responsive Design**

The app automatically adapts to different screen sizes:
- **Desktop (>900px)**: Projects display in rows
- **Mobile (≤900px)**: Projects stack vertically
- **Images**: Automatically scale and maintain aspect ratio

## 🚀 **Best Practices**

1. **Image Optimization**: Keep images under 500KB for fast loading
2. **Consistent Sizing**: Use similar aspect ratios for project images
3. **Color Harmony**: Choose colors that complement your brand
4. **Descriptive Text**: Write clear, concise project descriptions
5. **Technology Tags**: Include relevant technologies for each project

## 🔧 **Troubleshooting**

### **Image Not Loading?**
- Check file path in `imagePath`
- Ensure image exists in the assets folder
- Verify `pubspec.yaml` includes the assets directory
- Run `flutter clean` and `flutter pub get`

### **Layout Issues?**
- Check if project data is properly formatted
- Ensure all required fields are provided
- Verify color and icon values are valid

### **Performance Issues?**
- Optimize image sizes
- Use appropriate image formats (JPG for photos, PNG for graphics)
- Consider lazy loading for many images

---

**Need Help?** The code is designed to be self-documenting. Each section has clear data structures that you can easily modify!
