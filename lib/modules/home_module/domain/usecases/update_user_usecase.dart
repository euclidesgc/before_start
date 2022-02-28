/*
curl -X PUT 
-H "X-Parse-Application-Id: 9k6Er3wTULxfBvjG12SXh4QbZ93cSMxrpXClMlpc" 
-H "X-Parse-REST-API-Key: lCIuL0H29AyrDCloq6XLbu9fIpYPNyQMuao9vYNO" 
-H "X-Parse-Session-Token: <SESSION_TOKEN>" 
-H "Content-Type: application/json" 
-d "{ "username": "A string",
      "email": "A string",
      "Roadmap": { 
        "__type": "Relation", 
        "className": "Roadmap" 
      },
      "perfil": { 
          "__type": "Relation", 
          "className": "Perfil" 
      } 
    }" 
https://mentoriabeforestart.b4a.io/users/<USER_OBJECT_ID>
*/