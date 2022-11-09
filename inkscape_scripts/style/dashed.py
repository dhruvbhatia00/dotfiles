for obj in selected_shapes():
    if 'stroke_dasharray' in obj.style() and obj.style()['stroke_dasharray'] == [5, 2.5]:
        obj.style(stroke_linejoin='bevel', stroke_dasharray='none')
    else:
        obj.style(stroke_linejoin='bevel', stroke_dasharray=[5, 2.5])
