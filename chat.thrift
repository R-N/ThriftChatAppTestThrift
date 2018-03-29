namespace java chat

struct User {
    1: i64 id;
    2: i64 revision;
    3: string name;
}

struct Room {
    1: i64 id;
    2: i64 revision;
    3: list<i64> memberIds;
}

struct Group {
    1: i64 id;
    2: i64 revision;
    3: list<i64> memberIds;
    4: string name;
}

struct ClientSession{
    1: i64 id;
    2: string session;
    3: string certificate;
}

enum ChatroomType{
    user = 0;
    room = 1;
    group = 2;
}

enum MessageContentType{
    text = 0;
}

struct Message {
    1: i64 id;
    2: i64 senderId;
    3: i64 timestamp;
    4: MessageContentType contentType;
    5: string content;
}
struct CompleteMessage {
    1: ChatroomType chatroomType;
    2: i64 chatroomId;
    3: Message message;
}


struct MessageBox{
    1: ChatroomType chatroomType;
    2: i64 chatroomId;
    3: list<Message> messages;
    4: i64 revision;
}

enum ErrorCode{
    usernameExists = 1;
    signupError = 2;
    loginError = 3;
    invalidSession = 4;
    invalidUserId = 5;
    invalidCertificate = 6;
    unknownError = 7;
    sendMessageError = 8;
    messageEmpty = 9;
    usernameEmpty = 10;
    passwordEmpty = 11;
    messageTooLong = 12;
}

exception ChatException {
    1: ErrorCode code;
}

enum OperationType{
    notifyMessages = 0;
}

struct Operation{
    1: OperationType type;
    2: i32 intParam1;
    3: i64 longParam1;
    4: i64 longParam2;
    5: i64 longParam3;
}

service Chat {
        ClientSession signup(
            1: string username, 
            2: string password
        ) throws (1: ChatException ex);
        
        ClientSession login(
            1: string username, 
            2: string password
        ) throws (1: ChatException ex);

        ClientSession getSession(
            1: i64 id,
            2: string certificate
        ) throws (1: ChatException ex);
        
        User getUserById(
            1: string session, 
            2: i64 id
        ) throws (1: ChatException ex);

        list<User> getUsersByIds(
            1: string session, 
            2: list<i64> ids
        ) throws (1: ChatException ex);

        MessageBox getOldMessages(
            1: string session,
            2: ChatroomType chatroomType,
            3: i64 chatroomId,
            4: i64 revision,
            5: i32 count
        ) throws (1: ChatException ex);
        
        MessageBox getLastMessages(
            1: string session,
            2: ChatroomType chatroomType,
            3: i64 chatroomId,
            4: i32 count,
            5: i32 offset
        ) throws (1: ChatException ex);
        
        MessageBox getNewMessages(
            1: string session,
            2: ChatroomType chatroomType,
            3: i64 chatroomId,
            4: i64 revision,
            5: i32 count
        ) throws (1: ChatException ex);
        
        CompleteMessage sendMessage(
            1: string session,
            2: CompleteMessage message
        ) throws (1: ChatException ex);
        
        list<Operation> fetchOperations(
            1: string session
        ) throws (1: ChatException ex);
}