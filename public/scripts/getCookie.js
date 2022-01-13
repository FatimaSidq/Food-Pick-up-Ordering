function getCookie(c_name) {
    const c_value = ` ${document.cookie}`;
    const c_start = c_value.indexOf(`${c_name}=`);
    if (c_start === -1) {
        return null;
    }

    let c_end = c_value.indexOf(";", c_value.indexOf("=", c_start) + 1);
    if (c_end === -1) {
        c_end = c_value.length;
    }
    return decodeURIComponent(c_value.substring(c_start, c_end)).replace(`${c_name}=`, "");
}