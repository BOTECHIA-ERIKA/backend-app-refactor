import { Roles } from "../enums/enums";

export interface IUsuario {
    id:string,
    primeiro_nome:string,
    ultimo_sobrenome: string,
    username: string,
    email: string,
    path_url: string,
    avatar:string,
    ROLE: Roles
}