package com.engineers.moyeo.main.model;

import java.util.Collection;
import java.util.Map;
import java.util.Set;

public class WordModel implements Map<String, Integer>{

	private static Map<String, Integer> wordMap;

	public static Map<String, Integer> getWordMap() {
		return wordMap;
	}

	public static void setWordMap(Map<String, Integer> wordMap) {
		WordModel.wordMap = wordMap;
	}

	@Override
	public void clear() {
		wordMap.clear();
	}

	@Override
	public boolean containsKey(Object key) {
		return wordMap.containsKey(key);
	}

	@Override
	public Integer get(Object key) {
		return wordMap.get(key);
	}

	@Override
	public boolean isEmpty() {
		return wordMap.isEmpty();
	}

	@Override
	public Set<String> keySet() {
		return wordMap.keySet();
	}

	@Override
	public Integer put(String key, Integer value) {
		return wordMap.put(key, value);
	}

	@Override
	public void putAll(Map<? extends String, ? extends Integer> m) {
		wordMap.putAll(m);
	}

	@Override
	public Integer remove(Object key) {
		return wordMap.remove(key);
	}

	@Override
	public int size() {
		return wordMap.size();
	}

	@Override
	public boolean containsValue(Object value) {
		return wordMap.containsValue(value);
	}

	@Override
	public Set<java.util.Map.Entry<String, Integer>> entrySet() {
		return wordMap.entrySet();
	}

	@Override
	public Collection<Integer> values() {
		return wordMap.values();
	}
	
	

}
