import jwt_decode from 'jwt-decode'

const LOCALSTORAGE_TOKEN_NAME = 'token'
class LocalStorageUtils {
    getItem(key: string) {
        if (typeof localStorage !== 'undefined') {
            const item = localStorage.getItem(key)
            if (!item) {
                this.setItem(key)
                return localStorage.getItem(key)
            }
            return JSON.parse(item || '{}')
        }
        return undefined
    }

    setItem(key: string, value = '') {
        if (typeof localStorage !== 'undefined' && value !== '') {
            localStorage.setItem(key, JSON.stringify(value))
        }
    }

    removeItem(key: string) {
        if (typeof localStorage !== 'undefined') {
            localStorage.removeItem(key)
        }
    }

    clear() {
        if (typeof localStorage !== 'undefined') {
            localStorage.clear()
        }
    }

    setUser(token: string | undefined) {
        if (typeof localStorage !== 'undefined') {
            this.setItem(LOCALSTORAGE_TOKEN_NAME, token)
        }
        return undefined
    }

    getUser() {
        if (typeof localStorage !== 'undefined') {
            const token = this.getItem(LOCALSTORAGE_TOKEN_NAME)
            try {
                if (token) return jwt_decode(token)
                else return token
            } catch (error) {
                return token
            }
        }
        return undefined
    }

    deleteUser() {
        this.removeItem(LOCALSTORAGE_TOKEN_NAME)
    }

    getToken() {
        return this.getItem(LOCALSTORAGE_TOKEN_NAME)
    }
}

export default new LocalStorageUtils()
