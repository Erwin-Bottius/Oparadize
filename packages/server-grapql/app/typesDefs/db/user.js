import { gql } from 'apollo-server-express';

// TODO : type from  base seems strange , check it and ajust this file
// describe witch keyword will be available in api

// this type need to corresponding to db's user types
const user = gql`
  type User {
    id: String!,
    first_name: String!,
    last_name: String!,
    civility: String,
    mail: String!,
    password: String!,
    address: String,
    city_code: String,
    city: String,
    number_phone: String,
  }

  extend type Query { # extend root Query
    users:[User]!
    user(email:String!):User! # argument is email
  }

  extend type Mutation {
    registerUser(
      first_name: String!,
      last_name: String!,
      civility: String,
      mail: String!,
      password: String!,
      address: String,
      city_code: String,
      city: String,
      number_phone: String!,
    ): User!
  }
`;
export default user;