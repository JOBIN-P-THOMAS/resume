# 🌐 Web Deployment Guide

## 🚀 Deploy to GitHub Pages

### 1. Build the Web App
```bash
flutter build web --release
```

### 2. Deploy to GitHub Pages

#### Option A: Using GitHub Actions (Recommended)
1. Create `.github/workflows/deploy.yml` in your repository:

```yaml
name: Deploy to GitHub Pages

on:
  push:
    branches: [ main ]

jobs:
  build:
    runs-on: ubuntu-latest

    steps:
    - uses: actions/checkout@v3
    
    - name: Setup Flutter
      uses: subosito/flutter-action@v2
      with:
        flutter-version: '3.8.1'
        channel: 'stable'
    
    - name: Install dependencies
      run: flutter pub get
    
    - name: Build web
      run: flutter build web --release
    
    - name: Deploy to GitHub Pages
      uses: peaceiris/actions-gh-pages@v3
      with:
        github_token: ${{ secrets.GITHUB_TOKEN }}
        publish_dir: ./build/web
```

#### Option B: Manual Deployment
1. Go to your GitHub repository
2. Navigate to Settings → Pages
3. Set source to "Deploy from a branch"
4. Select branch: `gh-pages` or `main`
5. Set folder to `/docs` or `/build/web`

### 3. Enable GitHub Pages
1. Go to repository Settings
2. Scroll down to "GitHub Pages" section
3. Select source branch and folder
4. Save the settings

## 🌍 Deploy to Other Platforms

### Netlify
1. Build the app: `flutter build web --release`
2. Drag and drop the `build/web` folder to Netlify
3. Your app will be live instantly

### Vercel
1. Install Vercel CLI: `npm i -g vercel`
2. Build the app: `flutter build web --release`
3. Deploy: `vercel build/web`

### Firebase Hosting
1. Install Firebase CLI: `npm install -g firebase-tools`
2. Login: `firebase login`
3. Init project: `firebase init hosting`
4. Build: `flutter build web --release`
5. Deploy: `firebase deploy`

## 📱 Mobile Optimization

The app is already optimized for mobile devices with:
- Responsive design that adapts to screen size
- Touch-friendly navigation
- Mobile-first bottom navigation
- Optimized layouts for small screens

## 🔧 Customization

### Update Content
- Modify screen content in `lib/screens/` files
- Update contact information and social links
- Customize colors and branding

### Update Styling
- Colors are defined in `lib/main.dart`
- Typography uses Google Fonts (Inter)
- Layout is responsive and mobile-friendly

## 📊 Performance

The web build includes:
- Tree-shaken icons (99%+ reduction)
- Optimized assets
- Responsive images
- Fast loading times

## 🌟 Features

### Desktop Experience
- Sidebar navigation
- Large, readable layouts
- Professional appearance

### Mobile Experience
- Bottom navigation
- Touch-optimized buttons
- Responsive grids and layouts

## 🎯 SEO Optimization

For better search engine visibility:
1. Add meta tags to `web/index.html`
2. Include relevant keywords
3. Optimize page titles and descriptions
4. Ensure fast loading times

## 🚀 Quick Start

```bash
# Clone repository
git clone <your-repo-url>
cd resume

# Install dependencies
flutter pub get

# Build for web
flutter build web --release

# Test locally
flutter run -d chrome

# Deploy to GitHub Pages
# Follow the deployment steps above
```

## 📱 Testing

### Test on Different Devices
- Desktop browsers (Chrome, Firefox, Safari, Edge)
- Mobile browsers (iOS Safari, Chrome Mobile)
- Tablet browsers
- Different screen sizes

### Test Features
- Navigation between screens
- Contact form functionality
- Social media links
- Responsive design

## 🎨 Customization Tips

### Colors
- Primary: `#0F172A` (Dark Blue)
- Secondary: `#3B82F6` (Blue)
- Accent: `#10B981` (Green)
- Background: `#F8FAFC` (Light Gray)

### Typography
- Font: Inter (Google Fonts)
- Weights: 400, 500, 600, 700, 800
- Responsive font sizes

### Layout
- Card-based design
- Consistent spacing (8px grid)
- Rounded corners (12px, 16px, 20px, 24px)
- Subtle shadows and borders

---

**Your interactive resume is now ready for the web! 🎉**

Deploy it to GitHub Pages and share the link with potential employers. The modern, professional design will make a great impression!
