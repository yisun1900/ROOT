<%@ page contentType="text/html;charset=gb2312" %>
<%@ page import='java.sql.*,java.io.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:useBean id="hygl" scope="page" class="hygl.Hygl"/>
<%@ include file="/getlogin.jsp"%>

<HTML>
<HEAD>
<TITLE>��Ʒ����</TITLE>
</HEAD>
<body bgcolor="#FFFFFF" text="#000000">
<form name="xhd" method="post" action="dm_dyxspj.jsp">

<%
String yhdlm=cf.GB2Uni(request.getParameter("yhdlm"));   //�û���¼��
String dwbh=cf.GB2Uni(request.getParameter("dwbh"));     //��λ���
String dwmc=cf.GB2Uni(request.getParameter("dwmc"));     //��λ����
String yhmc=cf.GB2Uni(request.getParameter("yhmc"));     //�û�����

String jyfs=cf.GB2Uni(request.getParameter("jyfs"));     //���׷�ʽ
String hykh=cf.GB2Uni(request.getParameter("hykh"));     //ˮ�ʷ�������
String hybh=cf.GB2Uni(request.getParameter("hybh"));     //ˮ�ʷ�������
String xsrq=cf.GB2Uni(request.getParameter("xsrq"));     //��������
String ckbm=cf.GB2Uni(request.getParameter("ckbm"));     //�ֿ����
String []xslb=request.getParameterValues("xslb");        //�����б�
String fszp=cf.GB2Uni(request.getParameter("fszp"));     //����Ʒ���۱�־
String gmyy=cf.GB2Uni(request.getParameter("gmyy"));
String gmyjbm=cf.GB2Uni(request.getParameter("gmyjbm"));

Connection conn=null;
PreparedStatement ps=null;
ResultSet rs=null;
String sql=null;

StringTokenizer xsxx=null;
String cpbm=null;
String khlx=null;//�ͻ�����,0:һ��ͻ�;1:��Ա
if (hykh!=null && !hykh.equals(""))
{
	khlx="1";
}
else{
	khlx="0";
}

double totalpayment=0;
  
String 	zp_ckbm=null;//��Ʒ�����
String 	ls=null;
int bj=0;
double bqj=0;//��ǩ��
double sxj=0;//ʵ����
double shjzkl=0;//ʵ���ۿ���
double zkl=0;//����ۿ���
String 	zkcx=null;//�ۿ۳���
String zpbm=null;
String zplx=null;
int sl=0;

String ywxh=cf.today().substring(2,4);//ҵ�����
String xh=null;
int count=0;

try{
	conn=cf.getConnection();

	//ȡˮ�ʷ�������
	if (khlx.equals("1"))
	{
		sql="select hybh from hy_hyxxb where hybh='"+hybh+"'";
		ps=conn.prepareStatement(sql);
		rs=ps.executeQuery();
		if(rs.next()){
		}
		else{
			out.println("���󣡲����ڵ�ˮ�ʷ�������");
			return;
		}
		rs.close();
		ps.close();
	}

	//����:ҵ�����
	sql="SELECT NVL(max(substr(ywxh,3,6))+1,1) FROM dm_xsjl WHERE substr(ywxh,1,2) ='"+ywxh+"'";   
	ps=conn.prepareStatement(sql);  
	rs=ps.executeQuery();
	if (rs.next()){
		xh=rs.getString(1);
	}
	rs.close();
	ps.close();

	ywxh=ywxh+cf.addZero(xh,6);

	//ȡ��Ʒ��
	sql="select ckbm from xt_ckxx where cklx='09' and dwbh='"+dwbh+"'";
	ps=conn.prepareStatement(sql);
	rs=ps.executeQuery();
	if(rs.next()){
		zp_ckbm=rs.getString(1);
	}

	rs.close();
	ps.close();

	conn.setAutoCommit(false);

	//��������Ϣ�е�ÿ����Ʒѭ��ȡֵ
	for(int i=1;i<xslb.length;i++)
	{
		bj=0;
		xsxx=new StringTokenizer(xslb[i],"/");
		cpbm=xsxx.nextToken();

		ls=xsxx.nextToken();
		bqj=Double.parseDouble(ls);
		ls=xsxx.nextToken();
		sxj=Double.parseDouble(ls);
		ls=xsxx.nextToken();
		shjzkl=Double.parseDouble(ls);
		ls=xsxx.nextToken();
		zkl=Double.parseDouble(ls);//Ӧ�õ��ۿ���

		if(shjzkl<zkl){       
			zkcx="1";//0:δ���ޣ�1:����
		}
		else{
			zkcx="0";
		}
		totalpayment+=sxj;
		 
		if(xsxx.countTokens()>0){    //ȷ���Ƿ�����Ʒ
			bj=xsxx.countTokens();    //������Ʒ��
		}

		//��ѯ�����Ƿ��ڿ���Ʒ
		sql="select count(*) from cp_cpxx where wlzt='00' and szdw='"+dwbh+"' and cpbm='"+cpbm+"'";
//		out.println(sql);
		ps=conn.prepareStatement(sql);
		rs=ps.executeQuery();
		if(rs.next()){
			count=rs.getInt(1);
		}
		rs.close();
		ps.close();
		if (count==0)
		{
			conn.rollback();
			out.println("<BR>����ʧ�ܣ����룺"+cpbm+"���ǳ�Ʒ���Ʒ");
			return;
		}

		 //�����ۼ�¼���뵽����������Ϣ���У�dm_xsjl��
		 sql="insert into dm_xsjl(dwbh,ywxh,cpbm,bqj,sxj,zkl,sjzkl,khlx,khbh,jyfs,czy,xsrq,zkcx,shbz,sfjs,ckbm,hjbm,cplb,bkbh,plbm,pmbm,lsj,ysj,jlzl,zsgg,zszl,psgg,pszl,jwbm,xsbddbh,lrrq,gmyy,gmyjbm)";
         sql+=" select ?,?,?,?,?,?,?,?,?,?,?,?,?,'9','0',ckbm,hjbm,cplb,bkbh,plbm,pmbm,lsj,ysj,jlzl,zsgg,zszl,psgg,pszl,jwbm,xsbddbh,?,?,? ";
         sql+=" from cp_cpxx where cpbm='"+cpbm+"' ";
         ps=conn.prepareStatement(sql);
         ps.setString(1,dwbh);
         ps.setString(2,ywxh);
		 ps.setString(3,cpbm);
    	 ps.setDouble(4,bqj);
    	 ps.setDouble(5,sxj);
    	 ps.setDouble(6,zkl);
    	 ps.setDouble(7,shjzkl);
		 ps.setString(8,khlx);
		 ps.setString(9,hybh);
         ps.setString(10,jyfs);
    	 ps.setString(11,yhdlm);
         ps.setDate(12,java.sql.Date.valueOf(xsrq));
         ps.setString(13,zkcx);
         ps.setDate(14,java.sql.Date.valueOf(cf.today()));
         ps.setString(15,gmyy);
         ps.setString(16,gmyjbm);

         ps.executeUpdate();
         ps.close();
         
		 //��ѧ�� 2003.9.24 ������ԭ��Ҫ�����۵Ĳ�Ʒ�ŵ�cp_cpxx1��
		 //�����۵Ĳ�Ʒ��Ϣ��cp_cpxx��cp_cpstxx�����Ƶ�cp_cpxx1��cp_cpstxx1��
		 sql  =  " insert into cp_cpxx1";
		 sql +=  " select * ";
		 sql +=  " from cp_cpxx where  cpbm=? ";
         ps=conn.prepareStatement(sql);  
		 ps.setString(1,cpbm);
		 ps.executeUpdate();
         ps.close();
         
		 sql  =  " insert into cp_cpstxx1";
		 sql +=  " select * from cp_cpstxx where  cpbm=? ";
         ps=conn.prepareStatement(sql);  
		 ps.setString(1,cpbm);
		 ps.executeUpdate();
         ps.close();
         
		 sql =  " delete from cp_cpstxx where  cpbm=? ";
         ps=conn.prepareStatement(sql);  
		 ps.setString(1,cpbm);
		 ps.executeUpdate();
         ps.close();

		 sql =  " delete from cp_cpxx where  cpbm=? ";
         ps=conn.prepareStatement(sql);  
		 ps.setString(1,cpbm);
		 ps.executeUpdate();
         ps.close();
		 //�������۲�Ʒ��Ϣ���ƶ�

    	 //��ѧ�� 2003.9.24 ע�ͣ�ԭ��Ҫ�����۵Ĳ�Ʒ�ŵ�cp_cpxx1��
		 //�޸Ĳ�Ʒ��Ϣ(����)��:
	     //sql="update cp_cpxx set ywxh=?,wlzt=?,xsrq=?,sxj=?,jyfs=?";
		 sql="update cp_cpxx1 set ywxh=?,wlzt=?,xsrq=?,sxj=?,jyfs=?,khbh=?,khlx=?";
		 sql+=" where cpbm='"+cpbm+"' and wlzt='00'";
         ps=conn.prepareStatement(sql);  
	     ps.setString(1,ywxh);
	     ps.setString(2,"05");
         ps.setDate(3,java.sql.Date.valueOf(xsrq));
    	 ps.setDouble(4,sxj);
	     ps.setString(5,jyfs);
	     ps.setString(6,hybh);
	     ps.setString(7,khlx);
         ps.executeUpdate();
         ps.close();
		 
		 //��ÿ����Ʒ���е�ÿ����Ʒѭ��ȡֵ
	     for(int j=1;j<=bj;j++){
	         zpbm=xsxx.nextToken();
			 //out.print(zpbm);
			 //����zpbm,ckbm�������Ϣ
	         sql="select sl,zplx  from cp_zpkc ";
	         sql+="  where zpbm='"+zpbm+"' and ckbm='"+zp_ckbm+"' and ztbm='2'";   
	         ps=conn.prepareStatement(sql);         
	         rs=ps.executeQuery();         
             if (rs.next()){         
		         sl=rs.getInt(1);
		         zplx=rs.getString(2);
	         }       
			 else{
				conn.rollback();
				out.println("������Ʒ���룺"+zpbm+"�����ڣ�");
				return;
			 }
             rs.close();
             ps.close();
			 if (sl<1)
			 {
				conn.rollback();
				out.println("������Ʒ���룺"+zpbm+"�Ŀ������Ϊ0��");
				return;
			 }
     
	         //������Ʒ������Ϣ
  	         sql="insert into dm_zpxs(ywxh,cpbm,xh,zpbm,ckbm,ztbm,plbm,sl,djzl,cbj,lsj,ysj,bqj,zplx) ";
	         sql+=" select ?,?,?,zpbm,ckbm,ztbm,plbm,1,djzl,cbj,lsj,ysj,bqj,zplx ";
             sql+="  from cp_zpkc ";
             sql+="  where zpbm='"+zpbm+"' and ckbm='"+zp_ckbm+"' and ztbm='2' ";   
	         ps=conn.prepareStatement(sql);
	         ps.setString(1,ywxh);
	         ps.setString(2,cpbm);
	         ps.setInt(3,j);
			 ps.executeUpdate();
			 ps.close();

			 if (zplx.equals("1"))//1����Ʒת��
	         {
				 //��ѧ�� 2003.9.24 ������ԭ��Ҫ�����۵Ĳ�Ʒ�ŵ�cp_cpxx1��
				 //�����ɳ�Ʒר�ɵ���Ʒ��Ϣ�������۵Ĳ�Ʒ��Ϣ��cp_cpxx��cp_cpstxx�����Ƶ�cp_cpxx1��cp_cpstxx1��
				 sql  =  " insert into cp_cpxx1";
				 sql +=  " select * ";
				 sql +=  " from cp_cpxx where  cpbm=? ";
				 ps=conn.prepareStatement(sql);  
				 ps.setString(1,zpbm);
				 ps.executeUpdate();
				 ps.close();
				 
				 sql  =  " insert into cp_cpstxx1";
				 sql +=  " select * from cp_cpstxx where  cpbm=? ";
				 ps=conn.prepareStatement(sql);  
				 ps.setString(1,zpbm);
				 ps.executeUpdate();
				 ps.close();
				 
				 sql =  " delete from cp_cpstxx where  cpbm=? ";
				 ps=conn.prepareStatement(sql);  
				 ps.setString(1,zpbm);
				 ps.executeUpdate();
				 ps.close();

				 sql =  " delete from cp_cpxx where  cpbm=? ";
				 ps=conn.prepareStatement(sql);  
				 ps.setString(1,zpbm);
				 ps.executeUpdate();
				 ps.close();
				 //�������۲�Ʒ��Ϣ���ƶ�
				 
				 //�޸Ĳ�Ʒ��Ϣ(����)��:
				 sql="update cp_cpxx1 set ywxh=?,wlzt=?,xsrq=?,sxj=0,jyfs=?,hybh=?,khlx=?";
				 sql+=" where cpbm='"+zpbm+"'";
				 //out.println(sql);
				 ps=conn.prepareStatement(sql);  
				 ps.setString(1,ywxh);
				 ps.setString(2,"05");
				 ps.setDate(3,java.sql.Date.valueOf(xsrq));
				 ps.setString(4,jyfs);
				 ps.setString(5,hybh);
				 ps.setString(6,khlx);
				 ps.executeUpdate();
				 ps.close();
	         }
			 //�޸���Ʒ��棬���������1��
             sql="update cp_zpkc set  sl=sl-1 ";
             sql+="  where zpbm='"+zpbm+"' and ckbm='"+zp_ckbm+"' and ztbm='2'";   
	         ps=conn.prepareStatement(sql);  
			 ps.executeUpdate();
			 ps.close();
			 //ɾ����Ʒ�⣬�������Ϊ0��¼��
             sql="delete from cp_zpkc ";
             sql+="  where zpbm='"+zpbm+"' and ckbm='"+zp_ckbm+"' and ztbm='2' and sl=0";   
	         ps=conn.prepareStatement(sql);  
			 ps.executeUpdate();
			 ps.close();
		}//end for loop(zp)
	}//end for loop(cp)


	//�����Ա���λ���
	if(hykh.length()>=1){
		hygl.addJf(conn,ywxh,out);
	}

	conn.commit();
	out.println("<BR>���۳ɹ���");
}
catch (Exception e){
	conn.rollback();
	out.print("���ݿ����ʧ�ܣ�" + e);
	out.print("sql=" + sql);
}
finally{
	try{
		conn.setAutoCommit(true);  
		if (ps!= null) ps.close();
		if (rs!=null) rs.close();
		if (conn != null) cf.close(conn);
	}
	catch (Exception e){
		out.println("���ݿ����ʧ�ܣ�"+e.getMessage());
	}
}
 %>
</form>
<p align="center">&nbsp;<a href="dm_txxssj.jsp?xsrq=<%=xsrq%>">��������</a></p>
<p align="center">&nbsp;<a href="printxssj.jsp?ywxh=<%=ywxh%>" target='_blank'>��ӡƱ��</a></p>
</body>
</html>

