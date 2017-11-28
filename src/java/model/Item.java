package model;

public interface Item {
	
	public int getPrice();
	public String getDescription();
	public String getName();
	public int getId();
	public int getQuantity();
	public void setQuantity(int amount);

}
