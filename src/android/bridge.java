package com.dnk.bridge;

import android.util.Log;

import org.apache.cordova.CordovaPlugin;
import org.apache.cordova.CallbackContext;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import org.apache.cordova.CordovaWebView;
import org.apache.cordova.CordovaInterface;

import java.util.ArrayList;
import java.util.List;

/**
 * This class echoes a string called from JavaScript.
 */
public class bridge extends CordovaPlugin {

    JSONArray files = new JSONArray();

    public void initialize(CordovaInterface cordova, CordovaWebView webView) {
        super.initialize(cordova, webView);
    }
    @Override
       public boolean execute(String action, JSONArray args, CallbackContext callbackContext) throws JSONException {
        Log.d("testxx","xx0"+action);
        if (action.equals("test")) {
			Log.d("testxx","xx1"+args.toString());
            callbackContext.success(args);
        }else if(action.equals("saveFile")) {
            for(int i=0;i<args.length();i++){
               files.put(args.get(i));
            }
            callbackContext.success(String.valueOf(files.length()));
        }else if(action.equals("saveRefFile")) {
            refFile = args;
            callbackContext.success(String.valueOf(refFile.length()));
        }else if(action.equals("getFile")) {
            callbackContext.success(files);
        }else if(action.equals("getRefFile")) {
            callbackContext.success(refFile);
        }else if(action.equals("deleteFile")) {
            if(args.length()>0){
                JSONArray rs = new JSONArray();
                for(int i=0;i<files.length();i++){
                    boolean del = false;
                    for(int j=0; i<args.length(); j++) {
                        if(i==args.getInt(j)){
                            del = true;
                            break;
                        }
                    }
                    if(!del){
                        rs.put(rs.length(),files.get(i));
                    }
                }
                files = rs;
            }else {
                files = new JSONArray();
            }
            callbackContext.success();
        }else if(action.equals("deleteRefFile")) {
            refFile = new JSONArray();
            callbackContext.success();
        }else if(action.equals("deleteAllFile")) {
            files = new JSONArray();
            refFile = new JSONArray();
            callbackContext.success();
        }else{
            callbackContext.error("no action");
            return false;
        }
        return true;
    }
}
