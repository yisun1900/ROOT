<%@ page contentType="text/html;charset=gb2312" %>
<%@ page import='java.sql.*,java.io.*' %>
<%@ page import="java.util.*" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:useBean id="sthh" scope="page" class="mybean.sqlbean.SaveToHy_Hyxxb"/>

<HTML>
<HEAD>
<TITLE>����˻��Ǽ�</TITLE>
</HEAD>
<%//���ǰһ��ҳ�洫���Ĳ���
  String yhdlm =cf.GB2Uni(request.getParameter("yhdlm"));  //�û���¼��
  String thdw=cf.GB2Uni(request.getParameter("thdw"));     //�˻���λ
  String cpbm=cf.GB2Uni(request.getParameter("cpbm"));     //��Ʒ����
  String thrq=cf.GB2Uni(request.getParameter("thrq"));     //�˻�����
  String thjg=cf.GB2Uni(request.getParameter("thj"));     //�˻���
  String thyy=cf.GB2Uni(request.getParameter("thyy"));     //�˻�ԭ��
%>
<body bgcolor="#FFFFFF" text="#000000">
<%
  Connection conn=null;
  PreparedStatement ps=null;
  ResultSet rs=null;
  String sql=new String();
  boolean successed=true;
  String bkbh=new String();
  String xsdw=new String();
  String ywxh=new String();
  float ckj=0;
  float jsl=0;
  String jyfs=new String();
  String khbh=new String();
  String khlx=new String();
  float sxj=0;
  float thj=Float.parseFloat(thjg);
  try{
      conn=cf.getConnection();
      conn.setAutoCommit(false);
      //���ݲ�Ʒ����Ӳ�Ʒ��Ϣ����ȡ�ò�Ʒ��Ϣ
	  //������š����۵�λ��ҵ����š�����ۡ������ʡ����׷�ʽ���ͻ���š��ͻ����ͣ�ʵ���ۣ�
      sql="select bkbh,xsdw,ywxh,ckj,jsl,jyfs,khbh,khlx,sxj from cp_cpxx where cpbm='"+cpbm+"'";
      //out.println(sql);
      ps=conn.prepareStatement(sql);
      rs=ps.executeQuery();
      if(rs.next()){
          bkbh=rs.getString(1);
		  xsdw=rs.getString(2);
		  ywxh=rs.getString(3);
		  ckj=rs.getFloat(4);
		  jsl=rs.getFloat(5);
		  jyfs=rs.getString(6);
		  khbh=rs.getString(7);
		  khlx=rs.getString(8);
		  sxj=rs.getFloat(9);
      }
      if(rs!=null) rs.close();
      if(ps!=null) ps.close();
      //���²�Ʒ��Ϣ���иò�Ʒ��ؼ�¼������״̬��Ϊ13������Ա��Ϊyhdlm���˻��۸�Ϊthj
      sql="update cp_cpxx set wlzt=?,czy=?,thj=? where cpbm='"+cpbm+"'";
      //out.println(sql);
      ps=conn.prepareStatement(sql);
      ps.setString(1,"13");
      ps.setString(2,yhdlm);
      ps.setFloat(3,thj);
      if(ps.executeUpdate()!=1){
          out.print("��Ʒ��Ϣ�޸�ʧ��");
          successed=false;
      }
      if(rs!=null) rs.close();
      if(ps!=null) ps.close();
      //���˻���¼�в����¼
	  //�˻�����thrq���˻���λthdw����Ʒ����cpbm�����۵�λxsdw���˻���thj���˻���־1������˻������ͻ����khbh
	  //����Աyhdlm���˻�ԭ��thyy����˱�־2��δ��ˣ���ҵ�����ywxh,ʵ����sxj��������jsl
      sql="insert into dm_thjl(thrq,thdw,cpbm,xsdw,thj,thbz,khbh,czy,thyy,shbz,ywxh,sxj,jsl)";
      sql+=" values(?,?,?,?,?,?,?,?,?,?,?,?,?)";
      ps=conn.prepareStatement(sql);
      ps.setDate(1,java.sql.Date.valueOf(thrq));
      ps.setString(2,thdw);
      ps.setString(3,cpbm);
      ps.setString(4,xsdw);
      ps.setFloat(5,thj);
      ps.setString(6,"1");
      ps.setString(7,khbh);
      ps.setString(8,yhdlm);
      ps.setString(9,thyy);
      ps.setString(10,"2");
      ps.setString(11,ywxh);
	  ps.setFloat(12,sxj);
	  ps.setFloat(13,jsl);
      if(ps.executeUpdate()!=1){
	  out.print("�����˻���¼ʧ��");
          successed=false;
      }
      if(rs!=null) rs.close();
      if(ps!=null) ps.close();
      if (successed){
          conn.commit();
	  out.print("����˻��Ǽǳɹ���");
      }else{
          conn.rollback();
	  out.print("����˻��Ǽ�ʧ�ܣ�");
      }
  }catch (Exception e){
     conn.rollback();
     out.print("���ݿ����ʧ�ܣ�" + e);
  }finally{
     try{
        conn.setAutoCommit(true);  
        if (ps!= null) ps.close();
        if (rs!=null) rs.close();
        if (conn != null) cf.close(conn);
     }catch (Exception e){
        out.println("���ݿ����ʧ�ܣ�"+e.getMessage());
     }
  }
%>
