import LocalStorageUtils from "./LocalStorageUtils";
import axios from "axios";

export const APP_API_URL = "http://localhost:3001/api/v1/"

export const getHeaders = () => {
    return {
        'Content-Type': 'application/json',
        Authorization: `Bearer ${LocalStorageUtils.getToken()}`,
    }
}

export const request = (endpoint, method, headers = {}, params = {}, body = {}) => {
    return axios({
        url: APP_API_URL + endpoint,
        method: method,
        headers:getHeaders(),
        params: params,
        data: body,
    })
}

export const get = ({ endpoint, params = {}, headers = {} }) => {
    return request(endpoint, 'GET', headers, params)
}

export function post({ endpoint, body = {}, params = {}, headers = {} }) {
    return request(endpoint, 'POST', headers, params, body)
}

export const put = ({ endpoint, body = {}, params = {}, headers = {} }) => {
    return request(endpoint, 'PUT', headers, params, body)
}

export const remove = ({ endpoint, body = {}, params = {}, headers = {} }) => {
    return request(endpoint, 'DELETE', headers, params, body)
}