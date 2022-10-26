import { NextPage } from "next";

const LandingPage:NextPage = () => {

    return(
        <>
            <h1>Hello World</h1>
            <div className="flex flex-wrap gap-2">
                <button className="btn btn-lg btn-primary">Button</button>
                <button className="btn btn-lg btn-secondary">Button</button>
                <button className="btn btn-lg btn-neutral">Button</button>
                <button className="btn btn-lg btn-success">Button</button>
                <button className="btn btn-lg btn-warning">Button</button>
                <button className="btn btn-lg btn-error">Button</button>
            </div>
            <div className="flex flex-wrap gap-2">
                <button className="btn btn-md btn-primary">Button</button>
                <button className="btn btn-md btn-secondary">Button</button>
                <button className="btn btn-md btn-neutral">Button</button>
                <button className="btn btn-md btn-success">Button</button>
                <button className="btn btn-md btn-warning">Button</button>
                <button className="btn btn-md btn-error">Button</button>
            </div>
            <div className="flex flex-wrap gap-2">
                <button className="btn btn-sm btn-primary">Button</button>
                <button className="btn btn-sm btn-secondary">Button</button>
                <button className="btn btn-sm btn-neutral">Button</button>
                <button className="btn btn-sm btn-success">Button</button>
                <button className="btn btn-sm btn-warning">Button</button>
                <button className="btn btn-sm btn-error">Button</button>
            </div>
        </>
    )
}

export default LandingPage