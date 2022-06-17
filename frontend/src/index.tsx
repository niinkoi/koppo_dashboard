import React from 'react'
import { RecoilRoot } from 'recoil'
import { createRoot } from 'react-dom/client'
import App from './App'

const root = createRoot(document.getElementById("root") as HTMLElement);
root.render(
    <React.StrictMode>
        <RecoilRoot>
            <App />
        </RecoilRoot>
    </React.StrictMode>
)
