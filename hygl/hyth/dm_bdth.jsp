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
  String thjg=cf.GB2Uni(request.getParameter("thj"));      //�˻���
  String thyy=cf.GB2Uni(request.getParameter("thyy"));     //�˻�ԭ��
%>
<body bgcolor="#FFFFFF" text="#000000">
<%
  Connection conn=null;
  PreparedStatement ps=null;
  ResultSet rs=null;
  String sql=new String();
  
  boolean success=true;
  String bkbh=new String();
  String xsdw=new String();
  String ywxh=new String();
  float ckj=0;
  float jsl=100;
  String jyfs=new String();
  String khbh=new String();
  String khlx=new String();
  String ckbm=new String();
  float sxj=0;
  float jsj=0;
  float cbj,lsj,bqj,rkj;
  cbj=lsj=bqj=rkj=0;
  float thj=Float.parseFloat(thjg);
  String plbm=new String();
  String hjbm="";
  boolean existed=false;
  try{
      conn=cf.getConnection();
      conn.setAutoCommit(false);
 

      //���ݲ�Ʒ����Ӳ�Ʒ��Ϣ����ȡ�ò�Ʒ��Ϣ
      //����š����۵�λ��ҵ����š�����ۡ������ʡ����׷�ʽ���ͻ���š��ͻ�����
	  //�ֿ���롢ʵ���ۡ�Ʒ����롢�ɱ��ۡ����ۼۡ���ǩ�ۡ�����
      sql="select bkbh,xsdw,ywxh,ckj,jsl,jyfs,khbh,khlx,ckbm,sxj,plbm,cbj,lsj,bqj,rkj";
	  sql+=" from cp_cpxx where cpbm='"+cpbm+"'";
      //out.print(sql);
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
		  ckbm=rs.getString(9);
		  sxj=rs.getFloat(10);
		  plbm=rs.getString(11);
		  cbj=rs.getFloat(12);
		  lsj=rs.getFloat(13);
		  bqj=rs.getFloat(14);
		  rkj=rs.getFloat(15);
      }
      rs.close();
      ps.close();


      //���²�Ʒ��Ϣ���иò�Ʒ��ؼ�¼������״̬��Ϊ00������Ա��Ϊyhdlm���˻��۸�Ϊthj,�����ʸ�Ϊjsl
	  //����۸�Ϊjsj�����ڱ�־��Ϊ0�����ڵ�λ��Ϊthdw���ֿ�����Ϊckbm���ͻ���Ÿ�Ϊnull���ͻ����͸�Ϊ0
      sql="update cp_cpxx set wlzt='00'";
	  sql+=" where cpbm='"+cpbm+"'";
      //out.print(sql);
      ps=conn.prepareStatement(sql);
      ps.executeUpdate();
      ps.close();


      //���˻���¼�в����¼
	  //�˻�����thrq���˻���λthdw����Ʒ����cpbm�����۵�λxsdw���˻���thj���˻���־0���ͻ����khbh������Աyhdlm
	  //�˻�ԭ��thyy����˱�־1�������jsj��ҵ�����ywxh��������jsl��ʵ����sxj
      sql="insert into dm_thjl(thrq,thdw,cpbm,xsdw,thj,thbz,khbh,czy,thyy,shbz,jsj,ywxh,jsl,sxj,sfjs)";
      sql+=" values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,'0')";
      //out.print(sql);
      ps=conn.prepareStatement(sql);
      ps.setDate(1,java.sql.Date.valueOf(thrq));
      ps.setString(2,thdw);
      ps.setString(3,cpbm);
      ps.setString(4,xsdw);
      ps.setFloat(5,thj);
      ps.setString(6,"0");
      ps.setString(7,khbh);
      ps.setString(8,yhdlm);
      ps.setString(9,thyy);
      ps.setString(10,"1");
      ps.setFloat(11,jsj);
      ps.setString(12,ywxh);
	  ps.setFloat(13,jsl);
	  ps.setFloat(14,sxj);
      if(ps.executeUpdate()!=1){
          out.print("�����˻���¼ʧ��");
          success=false;
      }
      if(rs!=null) rs.close();
      if(ps!=null) ps.close();
      //out.print("ok");
      //����ͻ�����Ϊ"1",���޸Ļ�Ա��ϸ��Ϣ��ͻ�Ա���Ѽ�¼��
	if(khlx.equals("1")){
		double xiaoFeiToJf=sthh.getXiaoFeiToJf();
		int jf=0;
		jf=(int)(sxj*xiaoFeiToJf);
		//�޸Ļ�Ա��ϸ��Ϣ
		sql="select hykh from hy_hyxxb where hykh='"+khbh+"' ";
		ps=conn.prepareStatement(sql);
		rs=ps.executeQuery();
		if(rs.next()){
			rs.close();
			ps.close();
			sql="update hy_hyxxb set gmcs=gmcs-?,xfzje=xfzje-?,jf=jf-?,wdhjf=wdhjf-? where hykh='"+khbh+"'";
			//System.out.println(sql);
			ps=conn.prepareStatement(sql);
			ps.setInt(1,0);
			ps.setFloat(2,sxj);
			ps.setInt(3,jf);
			ps.setInt(4,jf);
			ps.executeUpdate();
			rs.close();
			ps.close();
		}//end if(rs.next())
		rs.close();
		ps.close();
  
		sql="select hykh from hy_hyxfjlb where hykh='"+khbh+"' and ywxh='"+ywxh+"' and gmdd='"+xsdw+"' ";
		ps=conn.prepareStatement(sql);
		rs=ps.executeQuery();
		if(rs.next()){
			rs.close();
			ps.close();
			  //�޸Ļ�Ա���Ѽ�¼
			sql="update hy_hyxfjlb set gmzje=gmzje-? where hykh='"+khbh+"' and ywxh='"+ywxh+"' and gmdd='"+xsdw+"'";
			ps=conn.prepareStatement(sql);
			ps.setFloat(1,sxj);
			ps.executeUpdate();
			rs.close();
			ps.close();
		}//end if(rs.next())
		rs.close();
		ps.close();
	}//end if khlx.equals("1")

/////////////////////////////////////////////////////////////////	  

	 conn.commit();
	 out.print("�����˻�����ɹ���");
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