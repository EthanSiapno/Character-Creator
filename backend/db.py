from flask_sqlalchemy import SQLAlchemy

db = SQLAlchemy()


class Character(db.Model):
    __tablename__ = 'character'
    id = db.Column(db.Integer, primary_key=True)
    backHairImageName = db.Column(db.String, nullable=False)
    frontHairImageName = db.Column(db.String, nullable=False)
    eyeImageName = db.Column(db.String, nullable=False)
    eyebrowImageName = db.Column(db.String, nullable=False)
    mouthImageName = db.Column(db.String, nullable=False)
    skinColorImageName = db.Column(db.String, nullable=False)
    outfitImageName = db.Column(db.String, nullable=False)
    shoeImageName = db.Column(db.String, nullable=False)
    earImageName = db.Column(db.String, nullable=False)

    def __init__(self, **kwargs):
        self.backHairImageName = kwargs.get('backHairImageName', 'blank')
        self.frontHairImageName = kwargs.get('frontHairImageName', 'blank')
        self.eyeImageName = kwargs.get('eyeImageName', 'blank')
        self.eyebrowImageName = kwargs.get('eyebrowImageName', 'blank')
        self.mouthImageName = kwargs.get('mouthImageName', 'blank')
        self.skinColorImageName = kwargs.get(
            'skinColorImageName', 'body_skin_1')
        self.outfitImageName = kwargs.get('outfitImageName', 'blank')
        self.shoeImageName = kwargs.get('shoeImageName', 'blank')
        self.earImageName = kwargs.get('earImageName', 'blank')

    def serialize(self):
        return {
            'id': self.id,
            'backHairImageName': self.backHairImageName,
            'frontHairImageName': self.frontHairImageName,
            'eyeImageName': self.eyeImageName,
            'eyebrowImageName': self.eyebrowImageName,
            'mouthImageName': self.mouthImageName,
            'skinColorImageName': self.skinColorImageName,
            'outfitImageName': self.outfitImageName,
            'shoeImageName': self.shoeImageName,
            'earImageName': self.earImageName
        }
