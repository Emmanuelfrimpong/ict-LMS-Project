class Lessons {
  String title;
  String description;
  String id, lessonNumber;
  int createdOn;
  List<Map<String, dynamic>> subTopics;
  List<Map<String, dynamic>> attachedFiles;
  Lessons(
      {this.title,
      this.description,
      this.id,
      this.subTopics,
      this.attachedFiles,
      this.createdOn,
      this.lessonNumber});

  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();
    map['title'] = title;
    map['description'] = description;
    map['id'] = id;
    map['createdOn'] = createdOn;
    map['lessonNumber'] = lessonNumber;
    map['subTopics'] = subTopics;
    map['attachedFiles'] = attachedFiles;
    return map;
  }

  Lessons.fromMapObject(Map<String, dynamic> map) {
    this.title = map['title'];
    this.description = map['description'];
    this.id = map['id'];
    this.createdOn = map['createdOn'];
    this.lessonNumber = map['lessonNumber'];
    this.subTopics = map['subTopics'];
    this.attachedFiles = map['attachedFiles'];
  }
}

List<Lessons> listOfLessons = [
  Lessons(
      title: 'Introduction to Computers',
      createdOn: 1611278524000,
      description:
          "The default value for the direction argument is horizontal if we don't set it. That means Flutter will try to put an item in the same row or beside the previous item as long as the space in the same row is enough to place a new item, before moving to the next row if the space isn't enough.",
      lessonNumber: 'Lesson 1',
      id: '1hbYngTiucDghoOmBrfh',
      subTopics: [
        {
          'title': 'History of Computers',
          'description': "Video provides a powerful way to help you prove your point. When you click Online Video, you can paste in the embed code for the video you want to add. You can also type a keyword to search online for the video that best fits your document."
              "To make your document look professionally produced, Word provides header, footer, cover page, and text box designs that complement each other. For example, you can add a matching cover page, header, and sidebar. Click Insert and then choose the elements you want from the different galleries."
              "Themes and styles also help keep your document coordinated. When you click Design and choose a new Theme, the pictures, charts, and SmartArt graphics change to match your new theme. When you apply styles, your headings change to match the new theme."
              "Save time in Word with new buttons that show up where you need them. To change the way a picture fits in your document, click it and a button for layout options appears next to it. When you work on a table, click where you want to add a row or a column, and then click the plus sign.Reading is easier, too, in the new Reading view. "
              "You can collapse parts of the document and focus on the text you want. If you need to stop reading before you reach the end, Word remembers where you left off - even on another device."
        },
        {
          'title': 'The Systems of Computer',
          'description': "Video provides a powerful way to help you prove your point. When you click Online Video, you can paste in the embed code for the video you want to add. You can also type a keyword to search online for the video that best fits your document."
              "To make your document look professionally produced, Word provides header, footer, cover page, and text box designs that complement each other. For example, you can add a matching cover page, header, and sidebar. Click Insert and then choose the elements you want from the different galleries."
              "Themes and styles also help keep your document coordinated. When you click Design and choose a new Theme, the pictures, charts, and SmartArt graphics change to match your new theme. When you apply styles, your headings change to match the new theme."
              "Save time in Word with new buttons that show up where you need them. To change the way a picture fits in your document, click it and a button for layout options appears next to it. When you work on a table, click where you want to add a row or a column, and then click the plus sign.Reading is easier, too, in the new Reading view. "
              "You can collapse parts of the document and focus on the text you want. If you need to stop reading before you reach the end, Word remembers where you left off - even on another device."
        },
        {
          'title': 'First Computer',
          'description': "Video provides a powerful way to help you prove your point. When you click Online Video, you can paste in the embed code for the video you want to add. You can also type a keyword to search online for the video that best fits your document."
              "To make your document look professionally produced, Word provides header, footer, cover page, and text box designs that complement each other. For example, you can add a matching cover page, header, and sidebar. Click Insert and then choose the elements you want from the different galleries."
              "Themes and styles also help keep your document coordinated. When you click Design and choose a new Theme, the pictures, charts, and SmartArt graphics change to match your new theme. When you apply styles, your headings change to match the new theme."
              "Save time in Word with new buttons that show up where you need them. To change the way a picture fits in your document, click it and a button for layout options appears next to it. When you work on a table, click where you want to add a row or a column, and then click the plus sign.Reading is easier, too, in the new Reading view. "
              "You can collapse parts of the document and focus on the text you want. If you need to stop reading before you reach the end, Word remembers where you left off - even on another device."
        },
        {
          'title': 'Test for a Steps.',
          'description': [
            {
              'point': 'This is how it is done.',
              'info': "To make your document look professionally produced, Word provides header, footer, cover page, and text box designs that complement each other. For example, you can add a matching cover page, header, and sidebar."
                  " Click Insert and then choose the elements you want from the different galleries."
            },
            {
              'point': 'This is how it is done.',
              'info': "To make your document look professionally produced, Word provides header, footer, cover page, and text box designs that complement each other. For example, you can add a matching cover page, header, and sidebar."
                  " Click Insert and then choose the elements you want from the different galleries."
            },
            {
              'point': 'This is how it is done.',
              'info': "To make your document look professionally produced, Word provides header, footer, cover page, and text box designs that complement each other. For example, you can add a matching cover page, header, and sidebar."
                  " Click Insert and then choose the elements you want from the different galleries."
            }
          ]
        },
        {
          'title': 'Test for a Steps without Description',
          'description': [
            {'point': 'This is how it is done.', 'info': ''},
            {'point': 'This is how it is done.', 'info': ""},
            {'point': 'This is how it is done.', 'info': ""}
          ]
        }
      ],
      attachedFiles: [
        {
          'title': 'Evolution of Computers',
          'type': 'video',
          'url': 'https://firebase.com'
        },
        {
          'title': 'The first Computer',
          'type': 'image',
          'url': 'https://firebase.com'
        },
        {
          'title': 'Listen to this Audio',
          'type': 'audio',
          'url': 'https://firebase.com'
        },
        {
          'title': 'Check this docs for more information',
          'type': 'pdf',
          'url': 'https://firebase.com'
        },
        {
          'title': 'Check this Ms word docs',
          'type': 'ms Word',
          'url': 'https://firebase.com'
        },
        {
          'title': 'Check this power point slides',
          'type': 'ppt',
          'url': 'https://firebase.com'
        }
      ]),
  Lessons(
      title: 'Booting',
      createdOn: 1611278524000,
      description:
          "The default value for the direction argument is horizontal if we don't set it. That means Flutter will try to put an item in the same row or beside the previous item as long as the space in the same row is enough to place a new item, before moving to the next row if the space isn't enough.",
      lessonNumber: 'Lesson 2',
      id: '1hbYkgTiucDghoOhhtBrfh',
      subTopics: [
        {
          'title': 'History of Computers',
          'description': "Video provides a powerful way to help you prove your point. When you click Online Video, you can paste in the embed code for the video you want to add. You can also type a keyword to search online for the video that best fits your document."
              "To make your document look professionally produced, Word provides header, footer, cover page, and text box designs that complement each other. For example, you can add a matching cover page, header, and sidebar. Click Insert and then choose the elements you want from the different galleries."
              "Themes and styles also help keep your document coordinated. When you click Design and choose a new Theme, the pictures, charts, and SmartArt graphics change to match your new theme. When you apply styles, your headings change to match the new theme."
              "Save time in Word with new buttons that show up where you need them. To change the way a picture fits in your document, click it and a button for layout options appears next to it. When you work on a table, click where you want to add a row or a column, and then click the plus sign.Reading is easier, too, in the new Reading view. "
              "You can collapse parts of the document and focus on the text you want. If you need to stop reading before you reach the end, Word remembers where you left off - even on another device."
        },
        {
          'title': 'The Systems of Computer',
          'description': "Video provides a powerful way to help you prove your point. When you click Online Video, you can paste in the embed code for the video you want to add. You can also type a keyword to search online for the video that best fits your document."
              "To make your document look professionally produced, Word provides header, footer, cover page, and text box designs that complement each other. For example, you can add a matching cover page, header, and sidebar. Click Insert and then choose the elements you want from the different galleries."
              "Themes and styles also help keep your document coordinated. When you click Design and choose a new Theme, the pictures, charts, and SmartArt graphics change to match your new theme. When you apply styles, your headings change to match the new theme."
              "Save time in Word with new buttons that show up where you need them. To change the way a picture fits in your document, click it and a button for layout options appears next to it. When you work on a table, click where you want to add a row or a column, and then click the plus sign.Reading is easier, too, in the new Reading view. "
              "You can collapse parts of the document and focus on the text you want. If you need to stop reading before you reach the end, Word remembers where you left off - even on another device."
        },
        {
          'title': 'First Computer',
          'description': "Video provides a powerful way to help you prove your point. When you click Online Video, you can paste in the embed code for the video you want to add. You can also type a keyword to search online for the video that best fits your document."
              "To make your document look professionally produced, Word provides header, footer, cover page, and text box designs that complement each other. For example, you can add a matching cover page, header, and sidebar. Click Insert and then choose the elements you want from the different galleries."
              "Themes and styles also help keep your document coordinated. When you click Design and choose a new Theme, the pictures, charts, and SmartArt graphics change to match your new theme. When you apply styles, your headings change to match the new theme."
              "Save time in Word with new buttons that show up where you need them. To change the way a picture fits in your document, click it and a button for layout options appears next to it. When you work on a table, click where you want to add a row or a column, and then click the plus sign.Reading is easier, too, in the new Reading view. "
              "You can collapse parts of the document and focus on the text you want. If you need to stop reading before you reach the end, Word remembers where you left off - even on another device."
        },
        {
          'title': 'Test for a Steps.',
          'description': [
            {
              'point': 'This is how it is done.',
              'info': "To make your document look professionally produced, Word provides header, footer, cover page, and text box designs that complement each other. For example, you can add a matching cover page, header, and sidebar."
                  " Click Insert and then choose the elements you want from the different galleries."
            },
            {
              'point': 'This is how it is done.',
              'info': "To make your document look professionally produced, Word provides header, footer, cover page, and text box designs that complement each other. For example, you can add a matching cover page, header, and sidebar."
                  " Click Insert and then choose the elements you want from the different galleries."
            },
            {
              'point': 'This is how it is done.',
              'info': "To make your document look professionally produced, Word provides header, footer, cover page, and text box designs that complement each other. For example, you can add a matching cover page, header, and sidebar."
                  " Click Insert and then choose the elements you want from the different galleries."
            }
          ]
        },
        {
          'title': 'Test for a Steps without Description',
          'description': [
            {'point': 'This is how it is done.', 'info': ''},
            {'point': 'This is how it is done.', 'info': ""},
            {'point': 'This is how it is done.', 'info': ""}
          ]
        }
      ],
      attachedFiles: [
        {
          'title': 'Evolution of Computers',
          'type': 'video',
          'url': 'https://firebase.com'
        },
        {
          'title': 'The first Computer',
          'type': 'image',
          'url': 'https://firebase.com'
        },
        {
          'title': 'Listen to this Audio',
          'type': 'audio',
          'url': 'https://firebase.com'
        },
        {
          'title': 'Check this docs for more information',
          'type': 'pdf',
          'url': 'https://firebase.com'
        },
        {
          'title': 'Check this Ms word docs',
          'type': 'docs',
          'url': 'https://firebase.com'
        },
        {
          'title': 'Check this power point slides',
          'type': 'docs',
          'url': 'https://firebase.com'
        }
      ]),
  Lessons(
      title: 'Computer Hardware and Software',
      createdOn: 1611278524000,
      description:
          "The default value for the direction argument is horizontal if we don't set it. That means Flutter will try to put an item in the same row or beside the previous item as long as the space in the same row is enough to place a new item, before moving to the next row if the space isn't enough.",
      lessonNumber: 'Lesson 3',
      id: '16bbYkgTiucDghPOhdtBrfh',
      subTopics: [
        {
          'title': 'History of Computers',
          'description': "Video provides a powerful way to help you prove your point. When you click Online Video, you can paste in the embed code for the video you want to add. You can also type a keyword to search online for the video that best fits your document."
              "To make your document look professionally produced, Word provides header, footer, cover page, and text box designs that complement each other. For example, you can add a matching cover page, header, and sidebar. Click Insert and then choose the elements you want from the different galleries."
              "Themes and styles also help keep your document coordinated. When you click Design and choose a new Theme, the pictures, charts, and SmartArt graphics change to match your new theme. When you apply styles, your headings change to match the new theme."
              "Save time in Word with new buttons that show up where you need them. To change the way a picture fits in your document, click it and a button for layout options appears next to it. When you work on a table, click where you want to add a row or a column, and then click the plus sign.Reading is easier, too, in the new Reading view. "
              "You can collapse parts of the document and focus on the text you want. If you need to stop reading before you reach the end, Word remembers where you left off - even on another device."
        },
        {
          'title': 'The Systems of Computer',
          'description': "Video provides a powerful way to help you prove your point. When you click Online Video, you can paste in the embed code for the video you want to add. You can also type a keyword to search online for the video that best fits your document."
              "To make your document look professionally produced, Word provides header, footer, cover page, and text box designs that complement each other. For example, you can add a matching cover page, header, and sidebar. Click Insert and then choose the elements you want from the different galleries."
              "Themes and styles also help keep your document coordinated. When you click Design and choose a new Theme, the pictures, charts, and SmartArt graphics change to match your new theme. When you apply styles, your headings change to match the new theme."
              "Save time in Word with new buttons that show up where you need them. To change the way a picture fits in your document, click it and a button for layout options appears next to it. When you work on a table, click where you want to add a row or a column, and then click the plus sign.Reading is easier, too, in the new Reading view. "
              "You can collapse parts of the document and focus on the text you want. If you need to stop reading before you reach the end, Word remembers where you left off - even on another device."
        },
        {
          'title': 'First Computer',
          'description': "Video provides a powerful way to help you prove your point. When you click Online Video, you can paste in the embed code for the video you want to add. You can also type a keyword to search online for the video that best fits your document."
              "To make your document look professionally produced, Word provides header, footer, cover page, and text box designs that complement each other. For example, you can add a matching cover page, header, and sidebar. Click Insert and then choose the elements you want from the different galleries."
              "Themes and styles also help keep your document coordinated. When you click Design and choose a new Theme, the pictures, charts, and SmartArt graphics change to match your new theme. When you apply styles, your headings change to match the new theme."
              "Save time in Word with new buttons that show up where you need them. To change the way a picture fits in your document, click it and a button for layout options appears next to it. When you work on a table, click where you want to add a row or a column, and then click the plus sign.Reading is easier, too, in the new Reading view. "
              "You can collapse parts of the document and focus on the text you want. If you need to stop reading before you reach the end, Word remembers where you left off - even on another device."
        },
        {
          'title': 'Test for a Steps.',
          'description': [
            {
              'point': 'This is how it is done.',
              'info': "To make your document look professionally produced, Word provides header, footer, cover page, and text box designs that complement each other. For example, you can add a matching cover page, header, and sidebar."
                  " Click Insert and then choose the elements you want from the different galleries."
            },
            {
              'point': 'This is how it is done.',
              'info': "To make your document look professionally produced, Word provides header, footer, cover page, and text box designs that complement each other. For example, you can add a matching cover page, header, and sidebar."
                  " Click Insert and then choose the elements you want from the different galleries."
            },
            {
              'point': 'This is how it is done.',
              'info': "To make your document look professionally produced, Word provides header, footer, cover page, and text box designs that complement each other. For example, you can add a matching cover page, header, and sidebar."
                  " Click Insert and then choose the elements you want from the different galleries."
            }
          ]
        },
        {
          'title': 'Test for a Steps without Description',
          'description': [
            {'point': 'This is how it is done.', 'info': ''},
            {'point': 'This is how it is done.', 'info': ""},
            {'point': 'This is how it is done.', 'info': ""}
          ]
        }
      ],
      attachedFiles: [
        {
          'title': 'Evolution of Computers',
          'type': 'video',
          'url': 'https://firebase.com'
        },
        {
          'title': 'The first Computer',
          'type': 'image',
          'url': 'https://firebase.com'
        },
        {
          'title': 'Listen to this Audio',
          'type': 'audio',
          'url': 'https://firebase.com'
        },
        {
          'title': 'Check this docs for more information',
          'type': 'pdf',
          'url': 'https://firebase.com'
        },
        {
          'title': 'Check this Ms word docs',
          'type': 'ms Word',
          'url': 'https://firebase.com'
        },
        {
          'title': 'Check this power point slides',
          'type': 'ppt',
          'url': 'https://firebase.com'
        }
      ]),
  Lessons(
      title: 'Computer Desktop',
      createdOn: 1611278524000,
      description:
          "The default value for the direction argument is horizontal if we don't set it. That means Flutter will try to put an item in the same row or beside the previous item as long as the space in the same row is enough to place a new item, before moving to the next row if the space isn't enough.",
      lessonNumber: 'Lesson 4',
      id: '6HbYkgTiJcDghPOhdtBmfh',
      subTopics: [
        {
          'title': 'History of Computers',
          'description': "Video provides a powerful way to help you prove your point. When you click Online Video, you can paste in the embed code for the video you want to add. You can also type a keyword to search online for the video that best fits your document."
              "To make your document look professionally produced, Word provides header, footer, cover page, and text box designs that complement each other. For example, you can add a matching cover page, header, and sidebar. Click Insert and then choose the elements you want from the different galleries."
              "Themes and styles also help keep your document coordinated. When you click Design and choose a new Theme, the pictures, charts, and SmartArt graphics change to match your new theme. When you apply styles, your headings change to match the new theme."
              "Save time in Word with new buttons that show up where you need them. To change the way a picture fits in your document, click it and a button for layout options appears next to it. When you work on a table, click where you want to add a row or a column, and then click the plus sign.Reading is easier, too, in the new Reading view. "
              "You can collapse parts of the document and focus on the text you want. If you need to stop reading before you reach the end, Word remembers where you left off - even on another device."
        },
        {
          'title': 'The Systems of Computer',
          'description': "Video provides a powerful way to help you prove your point. When you click Online Video, you can paste in the embed code for the video you want to add. You can also type a keyword to search online for the video that best fits your document."
              "To make your document look professionally produced, Word provides header, footer, cover page, and text box designs that complement each other. For example, you can add a matching cover page, header, and sidebar. Click Insert and then choose the elements you want from the different galleries."
              "Themes and styles also help keep your document coordinated. When you click Design and choose a new Theme, the pictures, charts, and SmartArt graphics change to match your new theme. When you apply styles, your headings change to match the new theme."
              "Save time in Word with new buttons that show up where you need them. To change the way a picture fits in your document, click it and a button for layout options appears next to it. When you work on a table, click where you want to add a row or a column, and then click the plus sign.Reading is easier, too, in the new Reading view. "
              "You can collapse parts of the document and focus on the text you want. If you need to stop reading before you reach the end, Word remembers where you left off - even on another device."
        },
        {
          'title': 'First Computer',
          'description': "Video provides a powerful way to help you prove your point. When you click Online Video, you can paste in the embed code for the video you want to add. You can also type a keyword to search online for the video that best fits your document."
              "To make your document look professionally produced, Word provides header, footer, cover page, and text box designs that complement each other. For example, you can add a matching cover page, header, and sidebar. Click Insert and then choose the elements you want from the different galleries."
              "Themes and styles also help keep your document coordinated. When you click Design and choose a new Theme, the pictures, charts, and SmartArt graphics change to match your new theme. When you apply styles, your headings change to match the new theme."
              "Save time in Word with new buttons that show up where you need them. To change the way a picture fits in your document, click it and a button for layout options appears next to it. When you work on a table, click where you want to add a row or a column, and then click the plus sign.Reading is easier, too, in the new Reading view. "
              "You can collapse parts of the document and focus on the text you want. If you need to stop reading before you reach the end, Word remembers where you left off - even on another device."
        },
        {
          'title': 'Test for a Steps.',
          'description': [
            {
              'point': 'This is how it is done.',
              'info': "To make your document look professionally produced, Word provides header, footer, cover page, and text box designs that complement each other. For example, you can add a matching cover page, header, and sidebar."
                  " Click Insert and then choose the elements you want from the different galleries."
            },
            {
              'point': 'This is how it is done.',
              'info': "To make your document look professionally produced, Word provides header, footer, cover page, and text box designs that complement each other. For example, you can add a matching cover page, header, and sidebar."
                  " Click Insert and then choose the elements you want from the different galleries."
            },
            {
              'point': 'This is how it is done.',
              'info': "To make your document look professionally produced, Word provides header, footer, cover page, and text box designs that complement each other. For example, you can add a matching cover page, header, and sidebar."
                  " Click Insert and then choose the elements you want from the different galleries."
            }
          ]
        },
        {
          'title': 'Test for a Steps without Description',
          'description': [
            {'point': 'This is how it is done.', 'info': ''},
            {'point': 'This is how it is done.', 'info': ""},
            {'point': 'This is how it is done.', 'info': ""}
          ]
        }
      ],
      attachedFiles: [
        {
          'title': 'Evolution of Computers',
          'type': 'video',
          'url': 'https://firebase.com'
        },
        {
          'title': 'The first Computer',
          'type': 'image',
          'url': 'https://firebase.com'
        },
        {
          'title': 'Listen to this Audio',
          'type': 'audio',
          'url': 'https://firebase.com'
        },
        {
          'title': 'Check this docs for more information',
          'type': 'pdf',
          'url': 'https://firebase.com'
        },
        {
          'title': 'Check this Ms word docs',
          'type': 'ms Word',
          'url': 'https://firebase.com'
        },
        {
          'title': 'Check this power point slides',
          'type': 'ppt',
          'url': 'https://firebase.com'
        }
      ]),
  Lessons(
      title: 'Word Processing',
      createdOn: 1611278524000,
      description:
          "The default value for the direction argument is horizontal if we don't set it. That means Flutter will try to put an item in the same row or beside the previous item as long as the space in the same row is enough to place a new item, before moving to the next row if the space isn't enough.",
      lessonNumber: 'Lesson 5',
      id: '6HbYkgT5JcDgh0OhKtB3fh',
      subTopics: [
        {
          'title': 'History of Computers',
          'description': "Video provides a powerful way to help you prove your point. When you click Online Video, you can paste in the embed code for the video you want to add. You can also type a keyword to search online for the video that best fits your document."
              "To make your document look professionally produced, Word provides header, footer, cover page, and text box designs that complement each other. For example, you can add a matching cover page, header, and sidebar. Click Insert and then choose the elements you want from the different galleries."
              "Themes and styles also help keep your document coordinated. When you click Design and choose a new Theme, the pictures, charts, and SmartArt graphics change to match your new theme. When you apply styles, your headings change to match the new theme."
              "Save time in Word with new buttons that show up where you need them. To change the way a picture fits in your document, click it and a button for layout options appears next to it. When you work on a table, click where you want to add a row or a column, and then click the plus sign.Reading is easier, too, in the new Reading view. "
              "You can collapse parts of the document and focus on the text you want. If you need to stop reading before you reach the end, Word remembers where you left off - even on another device."
        },
        {
          'title': 'The Systems of Computer',
          'description': "Video provides a powerful way to help you prove your point. When you click Online Video, you can paste in the embed code for the video you want to add. You can also type a keyword to search online for the video that best fits your document."
              "To make your document look professionally produced, Word provides header, footer, cover page, and text box designs that complement each other. For example, you can add a matching cover page, header, and sidebar. Click Insert and then choose the elements you want from the different galleries."
              "Themes and styles also help keep your document coordinated. When you click Design and choose a new Theme, the pictures, charts, and SmartArt graphics change to match your new theme. When you apply styles, your headings change to match the new theme."
              "Save time in Word with new buttons that show up where you need them. To change the way a picture fits in your document, click it and a button for layout options appears next to it. When you work on a table, click where you want to add a row or a column, and then click the plus sign.Reading is easier, too, in the new Reading view. "
              "You can collapse parts of the document and focus on the text you want. If you need to stop reading before you reach the end, Word remembers where you left off - even on another device."
        },
        {
          'title': 'First Computer',
          'description': "Video provides a powerful way to help you prove your point. When you click Online Video, you can paste in the embed code for the video you want to add. You can also type a keyword to search online for the video that best fits your document."
              "To make your document look professionally produced, Word provides header, footer, cover page, and text box designs that complement each other. For example, you can add a matching cover page, header, and sidebar. Click Insert and then choose the elements you want from the different galleries."
              "Themes and styles also help keep your document coordinated. When you click Design and choose a new Theme, the pictures, charts, and SmartArt graphics change to match your new theme. When you apply styles, your headings change to match the new theme."
              "Save time in Word with new buttons that show up where you need them. To change the way a picture fits in your document, click it and a button for layout options appears next to it. When you work on a table, click where you want to add a row or a column, and then click the plus sign.Reading is easier, too, in the new Reading view. "
              "You can collapse parts of the document and focus on the text you want. If you need to stop reading before you reach the end, Word remembers where you left off - even on another device."
        },
        {
          'title': 'Test for a Steps.',
          'description': [
            {
              'point': 'This is how it is done.',
              'info': "To make your document look professionally produced, Word provides header, footer, cover page, and text box designs that complement each other. For example, you can add a matching cover page, header, and sidebar."
                  " Click Insert and then choose the elements you want from the different galleries."
            },
            {
              'point': 'This is how it is done.',
              'info': "To make your document look professionally produced, Word provides header, footer, cover page, and text box designs that complement each other. For example, you can add a matching cover page, header, and sidebar."
                  " Click Insert and then choose the elements you want from the different galleries."
            },
            {
              'point': 'This is how it is done.',
              'info': "To make your document look professionally produced, Word provides header, footer, cover page, and text box designs that complement each other. For example, you can add a matching cover page, header, and sidebar."
                  " Click Insert and then choose the elements you want from the different galleries."
            }
          ]
        },
        {
          'title': 'Test for a Steps without Description',
          'description': [
            {'point': 'This is how it is done.', 'info': ''},
            {'point': 'This is how it is done.', 'info': ""},
            {'point': 'This is how it is done.', 'info': ""}
          ]
        }
      ],
      attachedFiles: [
        {
          'title': 'Evolution of Computers',
          'type': 'video',
          'url': 'https://firebase.com'
        },
        {
          'title': 'The first Computer',
          'type': 'image',
          'url': 'https://firebase.com'
        },
        {
          'title': 'Listen to this Audio',
          'type': 'audio',
          'url': 'https://firebase.com'
        },
        {
          'title': 'Check this docs for more information',
          'type': 'pdf',
          'url': 'https://firebase.com'
        },
        {
          'title': 'Check this Ms word docs',
          'type': 'ms Word',
          'url': 'https://firebase.com'
        },
        {
          'title': 'Check this power point slides',
          'type': 'ppt',
          'url': 'https://firebase.com'
        }
      ]),
];
