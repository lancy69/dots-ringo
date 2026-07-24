import { defineConfig } from 'vitepress'

// https://vitepress.dev/reference/site-config
export default defineConfig({
  title: 'Ringo',
  description: 'A MacOS configuration that rocks.',
  base: '/dots-ringo/',
  themeConfig: {
    // https://vitepress.dev/reference/default-theme-config
    sidebar: [
      {
        text: 'Introduction',
        items: [
          { text: 'About Ringo', link: '/pages/about-ringo' },
          { text: 'Getting Started', link: '/pages/getting-started' }
        ]
      }
    ],

    socialLinks: [
      { icon: 'github', link: 'https://github.com/lancy69/dots-ringo' }
    ]
  }
})
