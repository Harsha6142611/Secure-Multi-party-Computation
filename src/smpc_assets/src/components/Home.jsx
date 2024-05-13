import React, { useEffect, useState } from 'react';
import { smpc } from "../../../declarations/smpc/index"


function Home() {
    const [hashValue, setHashValue] = useState('');
    const [numUsers, setNumUsers] = useState(0);
    const [listOfHash, setListOfHash] = useState();
    const [result, setResult] = useState('');
    const maxUsers = 3; // Set the maximum number of users

    const handleSubmit = async () => {
        try {
            // Call the submitSecretShare method on the backend actor for each user
            await smpc.submitHashValue(hashValue);
            setHashValue('');
        } catch (error) {
            console.error('Error submitting secret share:', error);
        }
    };

    const handleCompute = async () => {
        try {
            // Call the computeHash method on the backend actor
            const computedHash = await smpc.computeHash();
            setResult(computedHash);
            console.log("Computingggggg..........." + computedHash);
        } catch (error) {
            console.error('Error computing hash:', error);
        }
    };

    useEffect(()=>{
      async function fetchCount(){
        try{
          const count = await smpc.getHashValueCount();
          const hashvalues = await smpc.getHashValues();
          const tempCount = Number(count);
          setListOfHash(hashvalues);
          setNumUsers(tempCount);
          // setCountt(count);
          console.log(count);
          console.log(tempCount);
        }catch (e) {
          console.log(e);
      }
      }
      fetchCount();
    },[hashValue]);

    return (
        <div>
          {/* <ul>
                {listOfHash.map((hashValues, index) => (
                    <li key={index}>{hashValues}</li>
                ))}
            </ul> */}
            {/* <p>{listOfHash}</p> */}
            <h1>Secure Hash Matching</h1>
            <input 
                type="text" 
                placeholder="Enter hash value..." 
                value={hashValue} 
                onChange={(e) => setHashValue(e.target.value)} 
            />
            <button onClick={handleSubmit}>Submit</button>
            <p>{numUsers} users have inputted hash values.</p>
            {numUsers >= maxUsers && <button onClick={handleCompute}>Compute Hash</button>}
            {result && <p>Computed Hash: {result}</p>}
        </div>
    );
}

export default Home;
