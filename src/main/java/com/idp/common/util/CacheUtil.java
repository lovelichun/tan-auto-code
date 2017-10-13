package com.idp.common.util;

import net.sf.ehcache.Cache;
import net.sf.ehcache.CacheManager;
import net.sf.ehcache.Element;

public class CacheUtil {

	private static CacheManager cacheManager;
	private static String cacheName = "tokenCache";
	
	public static Cache getCache(){
		
		if(cacheManager == null){
			
			cacheManager = CacheManager.getInstance();
		}
		
		return cacheManager.getCache(cacheName);
	}
	
	public static Object getCacheValue(String key){
		
		Element element = getCache().get(key);
		
		if(element == null){
			
			return null;
		}
		
		return element.getObjectValue();
	}
	
	public static void putCache(String key, Object value){
		
		getCache().put(new Element(key, value));
		
	}
	
	public static void removeCache(String key){
		
		getCache().remove(key);
	}
}
