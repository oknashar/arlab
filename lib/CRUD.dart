import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class CrudFire{
  bool auth(){
    return FirebaseAuth.instance.currentUser()!=null?true:false;
  }


  Future<void> create(data)async{
    if(auth()){
      Firestore.instance.collection("Items").add(data);
    }

  }

  getData() async{
    FirebaseUser userdata = await FirebaseAuth.instance.currentUser();
    return await Firestore.instance.collection('Items').where('userid',isEqualTo:userdata.uid ).getDocuments();
  }

  update(data,docid) async{
    Firestore.instance.collection('Items').document(docid).setData(data);
  }
  delete(docid) async{
    Firestore.instance.collection('Items').document(docid).delete();
  }
}