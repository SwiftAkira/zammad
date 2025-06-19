# Custom Changes Log

This document tracks all customizations made to this Zammad instance.

## 🎨 Branding Changes

### Logo Customization
- **File**: `public/assets/images/logo.svg`
- **Change**: Replace default Zammad logo with custom company logo
- **Status**: 🔄 Planned

### Theme Customization
- **File**: `app/assets/stylesheets/zammad.scss`
- **Change**: Update primary colors and branding
- **Status**: 🔄 Planned

## 🔧 Functional Changes

### Custom User Fields
- **Files**: 
  - `db/migrate/` (new migration)
  - `app/models/user.rb` (if needed)
- **Change**: Add custom user attributes
- **Status**: 🔄 Planned

### API Customizations
- **Files**: `app/controllers/`
- **Change**: Custom API endpoints
- **Status**: 🔄 Planned

## 🚀 Deployment Info

- **Branch**: `custom-deployment`
- **Docker Image**: `yourdockeruser/zammad-custom:latest`
- **K8s Namespace**: TBD

## 📝 Development Notes

1. Always test changes locally before building Docker image
2. Use semantic versioning for Docker tags
3. Keep this log updated with each change
4. Document rollback procedures for major changes

---

**Last Updated**: $(date)
**Next Steps**: Set up development environment with Ruby 3.3.8 