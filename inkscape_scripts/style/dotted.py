for obj in selected_shapes():
    if 'stroke_dasharray' in obj.style() and obj.style()['stroke_dasharray']==[1.25, 3.75]:
        obj.style(stroke_linejoin='bevel', stroke_dasharray='none')
    else:
        obj.style(stroke_linejoin='bevel', stroke_dasharray=[1.25, 3.75])
