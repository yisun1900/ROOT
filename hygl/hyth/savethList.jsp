<%@ page contentType="text/html;charset=gb2312" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:useBean id="hygl" scope="page" class="hygl.Hygl"/>
<%@ include file="/getlogin.jsp"%>


<HTML>
<HEAD>
<TITLE>����˻��Ǽ�</TITLE>
</HEAD>
<body bgcolor="#FFFFFF" text="#000000">
<%
  
String thdw =request.getParameter("thdw");  //�˻���λ
String thrq =request.getParameter("thrq");  //�˻�����
String thczy =request.getParameter("thczy");  
String[] thlx=request.getParameterValues("thlx");
String[] thyy=request.getParameterValues("thyy");//�˻�ԭ��
String[] thj=request.getParameterValues("thj");//�˻���
String[] cpbm=request.getParameterValues("cpbm");//��Ʒ����

String[] dwbh=request.getParameterValues("dwbh");//��Ʒ����
String[] sxj=request.getParameterValues("sxj");//��Ʒ����
String[] ywxh=request.getParameterValues("ywxh");//��Ʒ����
String[] khbh=request.getParameterValues("khbh");//��Ʒ����
String[] khlx=request.getParameterValues("khlx");//��Ʒ����
String[] jyfs=request.getParameterValues("jyfs");//��Ʒ����

Connection conn=null;
PreparedStatement ps=null;
ResultSet rs=null;
PreparedStatement ps1=null;
ResultSet rs1=null;
String sql=new String();

boolean success=true;

String thjlh=cf.today().substring(2,4);
String xh=null;


double dthj=0;
int i=0;
int count=0;
try{
	conn=cf.getConnection();
	
	sql="SELECT NVL(max(substr(thjlh,3,6))+1,1) FROM dm_thjl WHERE substr(thjlh,1,2) ='"+thjlh+"'";   
	ps=conn.prepareStatement(sql);  
	rs=ps.executeQuery();
	if (rs.next()){
		xh=rs.getString(1);
	}
	rs.close();
	ps.close();

	thjlh=thjlh+cf.addZero(xh,6);

	conn.setAutoCommit(false);
	for (i=0;i<cpbm.length ;i++ )
	{
		if (thj[i].equals(""))
		{
			out.println("��Ʒ���룺"+cpbm[i]+"��<�˻����>����Ϊ�գ�");
			conn.rollback();
			return;
		}
		else{
			dthj=Double.parseDouble(thj[i]);
		}
		if (thyy[i].equals(""))
		{
			out.println("��Ʒ���룺"+cpbm[i]+"��<�˻�ԭ��>����Ϊ�գ�");
			conn.rollback();
			return;
		}
		else{
			thyy[i]=cf.GB2Uni(thyy[i]);
		}
		//��ѧ��2003.9.24�޸ģ����۵Ĳ�Ʒ��Ϣ��cp_cpxx1��
		//sql="select count(*) FROM cp_cpxx WHERE cpbm='"+cpbm[i]+"' and wlzt='05'";
		sql="select count(*) FROM cp_cpxx1 WHERE cpbm='"+cpbm[i]+"' and wlzt='05'";
		ps=conn.prepareStatement(sql);  
		rs=ps.executeQuery();
		if (rs.next()){
			count=rs.getInt(1);
		}
		rs.close();
		ps.close();
		if (count==0)
		{
			out.println("��Ʒ���룺"+cpbm[i]+"���������۲�Ʒ��");
			conn.rollback();
			return;
		}

		
		String ckbm=null;
		String hjbm=null;
		sql="select ckbm FROM xt_ckxx WHERE dwbh='"+thdw+"' and cklx='01' order by ckbm";
		ps=conn.prepareStatement(sql);  
		rs=ps.executeQuery();
		if (rs.next()){
			ckbm=rs.getString(1);
		}
		else{
			out.println("�����޳�Ʒ��");
			conn.rollback();
			return;
		}
		rs.close();
		ps.close();
		sql="select hjbm FROM xt_hjxx WHERE ckbm='"+ckbm+"' order by hjbm";
		ps=conn.prepareStatement(sql);  
		rs=ps.executeQuery();
		if (rs.next()){
			hjbm=rs.getString(1);
		}
		else{
			out.println("���󣡳�Ʒ���޻���");
			conn.rollback();
			return;
		}
		rs.close();
		ps.close();
		//��ѧ��2003.9.24�޸�cp_cpxxΪcp_cpxx1��ԭ�����۵Ĳ�Ʒ��Ϣ��cp_cpxx1��
		if (thlx[i].equals("0"))//0���ꣻ
		{
			//sql="update cp_cpxx set wlzt='00',thjlh='"+thjlh+"',thrq=TO_DATE('"+thrq+"','YYYY-MM-DD'),thj="+thj[i];
			sql="update cp_cpxx1 set wlzt='00',thjlh='"+thjlh+"',thrq=TO_DATE('"+thrq+"','YYYY-MM-DD'),thj="+thj[i];
			sql+=" where cpbm='"+cpbm[i]+"'";
			ps=conn.prepareStatement(sql);
			ps.executeUpdate();
			ps.close();

			//���˻���¼�в����¼
			sql="insert into dm_thjl(thjlh,cpbm,thdw,thj,thyy,thbz,thrq,czy,ywxh,xsdw,sxj,khbh,shbz,sfjs,jyfs,ckbm,hjbm,cplb,bkbh,plbm,pmbm,lsj,ysj,jlzl,zsgg,zszl,psgg,pszl,bqj,khlx)";
			sql+=" select  ?,?,?,"+thj[i]+",?,?,?,?,?,?,"+sxj[i]+",?,'2','0',?,ckbm,hjbm,cplb,bkbh,plbm,pmbm,lsj,ysj,jlzl,zsgg,zszl,psgg,pszl,bqj,? ";
			sql+=" from cp_cpxx1 where cpbm='"+cpbm[i]+"' ";
			//out.print(sql);
			ps=conn.prepareStatement(sql);
			ps.setString(1,thjlh);
			ps.setString(2,cpbm[i]);
			ps.setString(3,thdw);
			ps.setString(4,thyy[i]);
			ps.setString(5,thlx[i]);
			ps.setDate(6,java.sql.Date.valueOf(thrq));
			ps.setString(7,thczy);
			ps.setString(8,ywxh[i]);
			ps.setString(9,dwbh[i]);
			ps.setString(10,khbh[i]);
			ps.setString(11,jyfs[i]);
			ps.setString(12,khlx[i]);
			ps.executeUpdate();
			ps.close();
		}
		else{//1���
			//sql="update cp_cpxx set wlzt='00',thjlh='"+thjlh+"',thrq=TO_DATE('"+thrq+"','YYYY-MM-DD'),thj="+thj[i];
			sql="update cp_cpxx1 set wlzt='00',thjlh='"+thjlh+"',thrq=TO_DATE('"+thrq+"','YYYY-MM-DD'),thj="+thj[i];
			sql+=" ,szdw='"+thdw+"',ckbm='"+ckbm+"',hjbm='"+hjbm+"'";
			sql+=" where cpbm='"+cpbm[i]+"'";
			ps=conn.prepareStatement(sql);
			ps.executeUpdate();
			ps.close();

			//���˻���¼�в����¼
			sql="insert into dm_thjl(thjlh,cpbm,thdw,thj,thyy,thbz,thrq,czy,ywxh,xsdw,sxj,khbh,shbz,sfjs,jyfs,ckbm,hjbm,cplb,bkbh,plbm,pmbm,lsj,ysj,jlzl,zsgg,zszl,psgg,pszl,bqj,khlx)";
			sql+=" select  ?,?,?,"+thj[i]+",?,?,?,?,?,?,"+sxj[i]+",?,'2','0',?,?,?,cplb,bkbh,plbm,pmbm,lsj,ysj,jlzl,zsgg,zszl,psgg,pszl,bqj,? ";
			sql+=" from cp_cpxx1 where cpbm='"+cpbm[i]+"' ";
			//out.print(sql);
			ps=conn.prepareStatement(sql);
			ps.setString(1,thjlh);
			ps.setString(2,cpbm[i]);
			ps.setString(3,thdw);
			ps.setString(4,thyy[i]);
			ps.setString(5,thlx[i]);
			ps.setDate(6,java.sql.Date.valueOf(thrq));
			ps.setString(7,thczy);
			ps.setString(8,ywxh[i]);
			ps.setString(9,dwbh[i]);
			ps.setString(10,khbh[i]);
			ps.setString(11,jyfs[i]);
			ps.setString(12,ckbm);
			ps.setString(13,hjbm);
			ps.setString(14,khlx[i]);
			ps.executeUpdate();
			ps.close();
		}


		//��ѧ�� 2003.9.24 ������ԭ��Ҫ���˻������۲�Ʒ�ŵ�cp_cpxx��
		//���˻������۲�Ʒ��Ϣ��cp_cpxx1��cp_cpstxx1�����Ƶ�cp_cpxx��cp_cpstxx��
		sql  =  " insert into cp_cpxx";
		sql +=  " select * ";
		sql +=  " from cp_cpxx1 where  cpbm=? ";
		ps=conn.prepareStatement(sql);  
		ps.setString(1,cpbm[i]);
		ps.executeUpdate();
		ps.close();

		sql  =  " insert into cp_cpstxx";
		sql +=  " select * from cp_cpstxx1 where  cpbm=? ";
		ps=conn.prepareStatement(sql);  
		ps.setString(1,cpbm[i]);
		ps.executeUpdate();
		ps.close();

		sql =  " delete from cp_cpstxx1 where  cpbm=? ";
		ps=conn.prepareStatement(sql);  
		ps.setString(1,cpbm[i]);
		ps.executeUpdate();
		ps.close();

		sql =  " delete from cp_cpxx1 where  cpbm=? ";
		ps=conn.prepareStatement(sql);  
		ps.setString(1,cpbm[i]);
		ps.executeUpdate();
		ps.close();
		//�����˻���Ʒ��Ϣ���ƶ�

		String zp_ckbm=null;
		String zpwlzt=null;
		//��ѯ��Ʒ�ֿ�
		sql="select ckbm FROM xt_ckxx WHERE dwbh='"+thdw+"' and cklx='09' order by ckbm";
		ps=conn.prepareStatement(sql);  
		rs=ps.executeQuery();
		if (rs.next()){
			zp_ckbm=rs.getString(1);
		}
		else{
			out.println("��������Ʒ��");
			conn.rollback();
			return;
		}
		rs.close();
		ps.close();

		//��ѯ����״̬
		sql="select wlzt from xt_ckxx where ckbm='"+zp_ckbm+"'";
		ps1=conn.prepareStatement(sql);
		rs1=ps1.executeQuery();
		if(rs1.next()){
			zpwlzt=rs1.getString(1);
		}
		rs1.close();
		ps1.close();
		//����Ʒ�˻���Ϣ�����¼
		sql="insert into dm_zpth(thjlh,cpbm,xh,zpbm,ckbm,xsck,ztbm,plbm,sl,djzl,cbj,lsj,ysj,bqj,zplx)";
		sql+=" select '"+thjlh+"',cpbm,xh,zpbm,'"+zp_ckbm+"',ckbm,ztbm,plbm,sl,djzl,cbj,lsj,ysj,bqj,zplx";
		sql+=" from dm_zpxs";
		sql+="  where  ywxh='"+ywxh[i]+"' and cpbm='"+cpbm[i]+"'";
		//out.print(sql);
		ps=conn.prepareStatement(sql);
		ps.executeUpdate();
		ps.close();

		String zpbm=null;
		String zplx=null;
		long zpxh=0;
		//���ݲ�Ʒ����Ӹ�����Ʒ���в�ѯ������Ʒ��Ϣ
		sql="select xh,zpbm,zplx from dm_zpxs ";
		sql+="  where  ywxh='"+ywxh[i]+"' and cpbm='"+cpbm[i]+"'";
//		out.println("<BR>"+sql);
		ps=conn.prepareStatement(sql);
		rs=ps.executeQuery();
		while(rs.next()){
			zpxh=rs.getLong(1);
			zpbm=rs.getString(2);
			zplx=rs.getString(3);
			

			sql="select count(*) from cp_zpkc ";
			sql+="  where zpbm='"+zpbm+"' and ckbm='"+zp_ckbm+"' and ztbm='2'";   
			ps1=conn.prepareStatement(sql);
			rs1=ps1.executeQuery();
			if (rs1.next())
			{
				count=rs1.getInt(1);
			}
			rs1.close();
			ps1.close();
			if (count==0)
			{
				//������Ʒ���
				sql="insert into cp_zpkc(zpbm,ckbm,ztbm,plbm,sl,djzl,cbj,lsj,ysj,bqj,zplx) ";
				sql+="  select zpbm,'"+zp_ckbm+"',ztbm,plbm,sl,djzl,cbj,lsj,ysj,bqj,zplx";
				sql+="  from dm_zpxs ";
				sql+="  where  ywxh='"+ywxh[i]+"' and cpbm='"+cpbm[i]+"' and xh="+zpxh;
//				out.println("<BR>"+sql);
				ps1=conn.prepareStatement(sql);  
				ps1.executeUpdate();
				ps1.close();
			}
			else{
				//�޸���Ʒ��棬
				sql="update cp_zpkc set sl=sl+1 ";
				sql+="  where zpbm='"+zpbm+"' and ckbm='"+zp_ckbm+"' and ztbm='2'";   
//				out.println("<BR>"+sql);
				ps1=conn.prepareStatement(sql);  
				ps1.executeUpdate();
				ps1.close();
			}
			if (zplx.equals("1"))
			{
				//�޸Ĳ�Ʒ��Ϣ
				//��ѧ��2003.9.24�޸�cp_cpxxΪcp_cpxx1,ԭ�����۵Ĳ�Ʒ��cp_cpxx1��
				sql="update cp_cpxx1 set wlzt='"+zpwlzt+"',thjlh='"+thjlh+"',thrq=TO_DATE('"+thrq+"','YYYY-MM-DD'),thj="+thj[i];
				sql+=" where cpbm=? ";
				ps1=conn.prepareStatement(sql);
				ps1.setString(1,zpbm);
				ps1.executeUpdate();
				ps1.close();

                //��ѧ�� 2003.9.24 ������ԭ��Ҫ���˻������۲�Ʒ�ŵ�cp_cpxx��
				//�����Ʒר�ɵ���Ʒ��Ϣ�����˻������۲�Ʒ��Ϣ��cp_cpxx1��cp_cpstxx1�����Ƶ�cp_cpxx��cp_cpstxx��
				sql  =  " insert into cp_cpxx";
				sql +=  " select *";
				sql +=  " from cp_cpxx1 where  cpbm=? ";
				ps1=conn.prepareStatement(sql);  
				ps1.setString(1,zpbm);
				ps1.executeUpdate();
				ps1.close();

				sql  =  " insert into cp_cpstxx";
				sql +=  " select * from cp_cpstxx1 where  cpbm=? ";
				ps1=conn.prepareStatement(sql);  
				ps1.setString(1,zpbm);
				ps1.executeUpdate();
				ps1.close();

				sql =  " delete from cp_cpstxx1 where  cpbm=? ";
				ps1=conn.prepareStatement(sql);  
				ps1.setString(1,zpbm);
				ps1.executeUpdate();
				ps1.close();

				sql =  " delete from cp_cpxx1 where  cpbm=? ";
				ps1=conn.prepareStatement(sql);  
				ps1.setString(1,zpbm);
				ps1.executeUpdate();
				ps1.close();
				//�����˻���Ʒ��Ϣ���ƶ�
			}
		}//end while loop
		rs.close();
		ps.close();
	  
	  //����ͻ�����Ϊ"1",���޸Ļ�Ա��ϸ��Ϣ��ͻ�Ա���Ѽ�¼��
		if(!khbh[i].equals("")){
			hygl.th(conn,Double.parseDouble(sxj[i]),khbh[i],ywxh[i],out);
		}
	}
 
	 conn.commit();
	 out.print("�˻�����ɹ���");
}
catch (NumberFormatException nfe){
	conn.rollback();
	out.print("����ʧ�ܣ�������Ĳ������֣�����������");
	out.print("<BR>�˻����=" + thj[i]);
}
catch (Exception e){
	conn.rollback();
	out.print("���ݿ����ʧ�ܣ�" + e);
	out.print("<BR>SQL=" + sql);
}
finally{
	try{
		conn.setAutoCommit(true);  
		if (rs!=null) rs.close();
		if (ps!= null) ps.close();
		if (rs1!=null) rs1.close();
		if (ps1!= null) ps1.close();
		if (conn != null) cf.close(conn);
	}catch (Exception e){
		out.println("���ݿ����ʧ�ܣ�"+e.getMessage());
	}
}
%>