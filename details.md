Details
=======

Learning Locker is an open source Learning Record Store. We are currently working towards our aim of becoming 100% compliant with the [xAPI specification](https://github.com/adlnet/xAPI-Spec/blob/master/xAPI.md#rtcom)

#### Learning Locker users
Learning Locker comes with 3 defined user roles: super, observer plus and observer.

*  **Super**: a super user (or super admin) has complete control over all aspects of the Learning Locker install. A super user can access all LRSs, delete, edit or remove them regardless of who created and can invite and remove users from the service.
*  **Observer plus**
*  **Observer**

The reason we have observer and observer plus is solely to provide an option to grant creating LRSs to a certain group of individuals.

Super users can decide which level of user can create and LRSs.

#### Learning Locker site and LRSs
An install of Learning Locker lets you create a site housing as many LRSs as you need. Each LRS is private to the person who created it and anyone they invite in. 

#### xAPI versions supported
Learning Locker only supports xAPI v1.0 and above. It is not suitable for platforms still using an earlier version of xAPI. At this time there are no plans to provide backwards compatibility for older versions of the spec.

## Quirks

#### Full stops in keys

MongoDB doesn't allow full stops (.) in keys. Therefore, we replace all full stops with &46; when saving statements. This does mean, to display the full statement on the site and before sending via the API we need to replace &46; throughout with the full stop using a simple function:

    //scan array and replace &46; with . (This is a result of . being reserved in Mongo)
    //convert array to json as this is faster for multi-dimensional arrays (?) @todo check this out.
    function replaceHtmlEntity( $array ){`
        return json_decode(str_replace('&46;','.', json_encode($array)));
    }