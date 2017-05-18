package com.coder.springmvc.entity;

import java.util.Arrays;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Lob;
import javax.persistence.Table;

@Entity
@Table(name="USER_DOCUMENT")
public class UserDocument {

	@Column(name="id")
	@Id @GeneratedValue(strategy=GenerationType.IDENTITY)
	private int Integer;
	
	@Column(name="name", length=100, nullable=false)
	private String name;
	
	@Column(name="description", length=255, nullable=false)
	private String description;
	
	@Column(name="type", length=100, nullable=false)
	private String type;
	
	@Lob @Column(name="content", nullable=false)
	private byte [] content;

	public int getInteger() {
		return Integer;
	}

	public void setInteger(int integer) {
		Integer = integer;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public byte[] getContent() {
		return content;
	}

	public void setContent(byte[] content) {
		this.content = content;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + Integer;
		result = prime * result + Arrays.hashCode(content);
		result = prime * result + ((description == null) ? 0 : description.hashCode());
		result = prime * result + ((name == null) ? 0 : name.hashCode());
		result = prime * result + ((type == null) ? 0 : type.hashCode());
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		UserDocument other = (UserDocument) obj;
		if (Integer != other.Integer)
			return false;
		if (!Arrays.equals(content, other.content))
			return false;
		if (description == null) {
			if (other.description != null)
				return false;
		} else if (!description.equals(other.description))
			return false;
		if (name == null) {
			if (other.name != null)
				return false;
		} else if (!name.equals(other.name))
			return false;
		if (type == null) {
			if (other.type != null)
				return false;
		} else if (!type.equals(other.type))
			return false;
		return true;
	}

	@Override
	public String toString() {
		return "UserDocument [Integer=" + Integer + ", name=" + name + ", description=" + description + ", type=" + type
				+ ", content=" + Arrays.toString(content) + "]";
	}
	
	
}





