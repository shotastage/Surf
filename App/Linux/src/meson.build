surf_sources = [
  'main.vala',
  'application.vala',
  'window.vala',
]

surf_deps = [
  dependency('gtk4'),
  dependency('libadwaita-1', version: '>= 1.4'),
]

surf_sources += gnome.compile_resources('surf-resources',
  'surf.gresource.xml',
  c_name: 'surf'
)

executable('surf', surf_sources,
  dependencies: surf_deps,
       install: true,
)
