import json
from db import db, Character
from flask import Flask, request
from sqlalchemy.sql.expression import func

db_filename = 'characters.db'
app = Flask(__name__)

app.config['SQLALCHEMY_DATABASE_URI'] = 'sqlite:///%s' % db_filename
app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = False
app.config['SQLALCHEMY_ECHO'] = True

db.init_app(app)
with app.app_context():
    db.create_all()


@app.route('/characters/')
def get_characters():
    param = request.args.to_dict()
    characters = [c.serialize() for c in Character.query.all()]
    for key in param:
        characters = list(filter(lambda c: str(c.get(key))
                                 == param[key], characters))

    res = {'success': True, 'data': characters}
    return json.dumps(res), 201


@app.route('/character/<int:id>/')
def get_character(id):
    character = Character.query.filter_by(id=id).first()
    if not character:
        return json.dumps({'success': False, 'error': 'Character id not found!'}), 404
    res = {'success': True, 'data': character.serialize()}
    return json.dumps(res), 201

# This function is not found on the docker/image version.
# @app.route('/character/recent/')
# def get_most_recent_char():
#    # Helper for iOS post requests
#    character = Character.query.order_by('id').all()[-1]
#    print(character)
#    if not character:
#        return json.dumps({'success': False, 'error': 'No characters found!'}), 404
#    res = {'success': True, 'data': character.serialize()}
#    return json.dumps(res), 201


@app.route('/character/', methods=['POST'])
def create_character():
    post_body = json.loads(request.data)
    backHair = post_body.get('backHairImageName', 'blank')
    frontHair = post_body.get('frontHairImageName', 'blank')
    eye = post_body.get('eyeImageName', 'blank')
    eyebrow = post_body.get('eyebrowImageName', 'blank')
    mouth = post_body.get('mouthImageName', 'blank')
    skinColor = post_body.get('skinColorImageName', 'blank')
    outfit = post_body.get('outfitImageName', 'blank')
    shoe = post_body.get('shoeImageName', 'blank')
    ear = post_body.get('earImageName', 'blank')

    character = Character(
        backHairImageName=backHair,
        frontHairImageName=frontHair,
        eyeImageName=eye,
        eyebrowImageName=eyebrow,
        mouthImageName=mouth,
        skinColorImageName=skinColor,
        outfitImageName=outfit,
        shoeImageName=shoe,
        earImageName=ear
    )
    db.session.add(character)
    db.session.commit()
    res = {'success': True, 'data': character.serialize()}
    return json.dumps(res), 201


@app.route('/character/<int:id>/', methods=['DELETE'])
def delete_character(id):
    character = Character.query.filter_by(id=id).first()
    if not character:
        return json.dumps({'success': False, 'error': 'Character id not found!'}), 404
    db.session.delete(character)
    db.session.commit()
    res = {'success': True, 'data': character.serialize()}
    return json.dumps(res), 201


@app.route('/character/<int:id>/', methods=['POST'])
def edit_character(id):
    delete_character(id)
    return create_character()


if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000, debug=True)
