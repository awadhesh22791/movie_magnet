package com.movie_magnet.entity;
// Generated 01-Oct-2023, 2:34:46 pm by Hibernate Tools 3.2.2.GA

import java.util.Date;

import org.hibernate.annotations.CreationTimestamp;
import org.hibernate.annotations.UpdateTimestamp;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.GeneratedValue;
import static jakarta.persistence.GenerationType.IDENTITY;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;
import jakarta.persistence.Temporal;
import jakarta.persistence.TemporalType;
import jakarta.persistence.UniqueConstraint;

/**
 * Reviews generated by hbm2java
 */
@Entity
@Table(name = "reviews", uniqueConstraints = @UniqueConstraint(columnNames = { "movie_id", "user_id" }))
public class Review implements java.io.Serializable {

	private static final long serialVersionUID = -8983293135426280741L;
	private Integer id;
	private User users;
	private Movie movies;
	private String reviewText;
	private int rating;
	private Date reviewDate;
	private Date createdAt;
	private Date updatedAt;

	@Id
	@GeneratedValue(strategy = IDENTITY)

	@Column(name = "id", unique = true, nullable = false)
	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "user_id", nullable = false)
	public User getUsers() {
		return this.users;
	}

	public void setUsers(User users) {
		this.users = users;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "movie_id", nullable = false)
	public Movie getMovies() {
		return this.movies;
	}

	public void setMovies(Movie movies) {
		this.movies = movies;
	}

	@Column(name = "review_text", nullable = false, length = 65535)
	public String getReviewText() {
		return this.reviewText;
	}

	public void setReviewText(String reviewText) {
		this.reviewText = reviewText;
	}

	@Column(name = "rating", nullable = false)
	public int getRating() {
		return this.rating;
	}

	public void setRating(int rating) {
		this.rating = rating;
	}

	@Temporal(TemporalType.DATE)
	@Column(name = "review_date", nullable = false, length = 10)
	public Date getReviewDate() {
		return this.reviewDate;
	}

	public void setReviewDate(Date reviewDate) {
		this.reviewDate = reviewDate;
	}

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "created_at", nullable = false, length = 19)
	@CreationTimestamp
	public Date getCreatedAt() {
		return this.createdAt;
	}

	public void setCreatedAt(Date createdAt) {
		this.createdAt = createdAt;
	}

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "updated_at", nullable = false, length = 19)
	@UpdateTimestamp
	public Date getUpdatedAt() {
		return this.updatedAt;
	}

	public void setUpdatedAt(Date updatedAt) {
		this.updatedAt = updatedAt;
	}

}
