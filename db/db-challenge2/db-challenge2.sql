-- usersテーブル
CREATE TABLE users (
  id INT PRIMARY KEY AUTO_INCREMENT,
  email VARCHAR(100) NOT NULL,
  password VARCHAR(100) NOT NULL,
  name VARCHAR(100) NOT NULL,
  intro VARCHAR(1000),
  phone_number VARCHAR(13),
  mobile_number VARCHAR(13),
  is_deleted TINYINT(1) DEFAULT 0 NOT NULL,
  created_at DATETIME NOT NULL,
  updated_at DATETIME NOT NULL
);

-- chatroomsテーブル
CREATE TABLE chatrooms (
  id INT PRIMARY KEY AUTO_INCREMENT,
  chatroom_name VARCHAR(100) NOT NULL,
  about VARCHAR(1000),
  file_enabled TINYINT(1) DEFAULT 1 NOT NULL,
  is_direct_chat TINYINT(1) DEFAULT 0 NOT NULL,
  is_deleted TINYINT(1) DEFAULT 0 NOT NULL,
  created_at DATETIME NOT NULL,
  created_user_id INT NOT NULL REFERENCES users(id),
  updated_at DATETIME NOT NULL,
  updated_user_id INT NOT NULL REFERENCES users(id)
);

-- user_in_chatroomテーブル
CREATE TABLE user_in_chatroom (
  chatroom_id INT REFERENCES chatrooms(id),
  user_id INT REFERENCES users(id),
  joined_at DATETIME NOT NULL,
  PRIMARY KEY(chatroom_id, user_id)
);

-- postsテーブル
CREATE TABLE posts (
  id INT PRIMARY KEY AUTO_INCREMENT,
  chatroom_id INT NOT NULL REFERENCES chatrooms(id),
  post VARCHAR(1000) NOT NULL,
  file_name VARCHAR(100),
  is_deleted TINYINT(1) DEFAULT 0 NOT NULL,
  posted_at DATETIME NOT NULL,
  posted_user_id INT NOT NULL REFERENCES users(id),
  updated_at DATETIME NOT NULL,
  updated_user_id INT NOT NULL REFERENCES users(id)
);

-- tasksテーブル
CREATE TABLE tasks (
  id INT PRIMARY KEY AUTO_INCREMENT,
  chatroom_id INT NOT NULL REFERENCES chatrooms(id),
  task VARCHAR(1000) NOT NULL,
  file_name VARCHAR(100),
  user_id_in_charge INT NOT NULL,
  deadline DATETIME,
  completed TINYINT(1) DEFAULT 0 NOT NULL,
  is_deleted TINYINT(1) DEFAULT 0 NOT NULL,
  created_at DATETIME NOT NULL,
  created_user_id INT NOT NULL REFERENCES users(id),
  updated_at DATETIME NOT NULL,
  updated_user_id INT NOT NULL REFERENCES users(id)
);
