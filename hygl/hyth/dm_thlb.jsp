<%@ page contentType="text/html;charset=gb2312" %>
<%@ page import='java.sql.*,java.io.*' %>
<%@ page import="java.util.*" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>

<html>
<head>
<title>�˻�����</title>
</head>
<%
  String yhdlm =cf.GB2Uni(request.getParameter("yhdlm"));
  String dwbh=cf.GB2Uni(request.getParameter("dwbh"));
  String dwmc=cf.GB2Uni(request.getParameter("dwmc"));
  String yhmc=cf.GB2Uni(request.getParameter("yhmc"));
  String thrq=cf.GB2Uni(request.getParameter("thrq"));
  String []thlb=request.getParameterValues("thlb");
%>
<%
  Connection conn=null;
  PreparedStatement ps=null;
  ResultSet rs=null;
  String sql=null;
  String temp_thxx=new String();
  StringTokenizer thxx=null;
  String cpbm=new String();
  String thj=new String();
  String thyy=new String();
  String pmmc=new String();
  String plmc=new String();
  String xsrq=new String();
  String ywxh=new String();
  float sxj=0;
  String xsdw=new String();
  String xsdwmc=new String();
  String wlzt=new String();
  String khbh=new String();
  String hykh=new String();
  String hyjb="�ǻ�Ա";
  /*int xh=0;
  String zpbm=new String();
  String zpmc=new String();
  String zpbmlb=new String();
  String zpmclb=new String();
  */
  String ktbz="";
  StringTokenizer temp_zpmclb=null;
%>
<body bgcolor="#FFFFFF" text="#000000">
<p align=center>�˻���</p>
<div align=center>
<table style="FONT-SIZE: 12px"  width=100% bgcolor=#999999 border=0 height="1">
  <tr bgcolor=#ffffff> 
    <td  align=right  colspan=13>����Ա:<%=yhmc%>&nbsp; &nbsp; &nbsp;    �˻�����:<%=thrq%></td>
  </tr>
  <tr bgcolor="#C0C0C0" align="center"> 
    <td   width=7% >���</td>
    <td   width=7% >��Ʒ����</td>
    <td   width=14% >Ʒ��</td>
    <td   width=7% >��������</td>
    <td   width=7% >���۵�λ</td>
    <td   width=7% >ҵ�����</td>
    <td   width=7% >ʵ����</td>
    <td   width=7% >�˻���</td>
    <td   width=7% >�˻�ԭ��</td>
    <td   width=7% >�ͻ����</td>
    <td   width=7% >��Ա����</td>
    <td   width=7% >����</td>
  </tr>

  <%try{
       conn=cf.getConnection();

       //���˻��б���ȡ��ÿ����Ϣ������Ϊ��Ʒ����/�˻��۸�/�˻�ԭ��
       for(int i=0;i<thlb.length;i++){
		  int xh=0;
		  String zpmc="";
		  String zpmclb="";
          ktbz="";  //���˱�־
		  String ydth="";
		  temp_thxx=cf.GB2Uni(thlb[i]);
		  //out.println(temp_thxx);
		  thxx=new StringTokenizer(temp_thxx,"/");
     	  cpbm=thxx.nextToken();  //��Ʒ�б�
		  thj=thxx.nextToken();   //�˻���
		  thyy=thxx.nextToken();  //�˻�ԭ��
		  ydth=thxx.nextToken();  //�Ƿ�����˻���0���� 1��꣩
		  //���ݲ�Ʒ�����cp_cpxx,xt_pmbm,xt_plbm�в�ѯ�ò�Ʒ����Ϣ
		  //(����Ʒ�����ơ�Ʒ�����ơ��������ڡ�ҵ����š�ʵ���ۡ����۵�λ)
		  sql="select xt_plbm.plmc,TO_CHAR(cp_cpxx.xsrq,'YY-MM-DD'),cp_cpxx.ywxh,";
		  sql+=" cp_cpxx.sxj,cp_cpxx.xsdw,sq_dwxx.dwmc,cp_cpxx.wlzt,cp_cpxx.ktbz";
		  sql+=" from cp_cpxx,xt_plbm,sq_dwxx";
		  sql+=" where cp_cpxx.cpbm='"+cpbm+"' ";
		  sql+=" and cp_cpxx.plbm=xt_plbm.plbm and cp_cpxx.xsdw=sq_dwxx.dwbh";
    	  ps=conn.prepareStatement(sql);
		  rs=ps.executeQuery();
		  if(rs.next()){  //���ڸ���Ʒ
			  plmc=rs.getString(2);
			  xsrq=rs.getString(3);
			  ywxh=rs.getString(4);
			  sxj=rs.getFloat(5);
			  xsdw=rs.getString(6);
			  xsdwmc=rs.getString(7);
			  wlzt=rs.getString(8);
			  ktbz=rs.getString(9);
	      }
		  else{
	          plmc="�Ǳ���˾��Ʒ";
		  }
	      //out.println(sql);
		  rs.close();
          ps.close();

		  //����Ըò�Ʒ�����Ĳ����Ǵ�������˻��Ǽǣ�������ݿ��ж�ȡ�˻��۸���˻�ԭ��
		  if(ydth.equals("1")){   //��������˻�
			  sql="select thj,thyy from dm_thjl where cpbm='"+cpbm+"' and xsdw='"+dwbh+"' ";
			  ps=conn.prepareStatement(sql);
			  rs=ps.executeQuery();
			  if(rs.next()){
			      thj=rs.getString(1);
				  thyy=rs.getString(2);
			  }
			  rs.close();
			  ps.close();
		  }// end if(ydth.equals("1"))

    	  //���ݲ�Ʒ�����cp_cpxx,hy_hyxxb,hy_hyjbb�в�ѯ�˿���Ϣ�������ͻ���źͻ�Ա����
		  sql="select cp_cpxx.khbh,hy_hyxxb.hykh,hy_hyjbb.hyjb";
		  sql+=" from cp_cpxx,hy_hyxxb,hy_hyjbb";
		  sql+=" where cp_cpxx.cpbm='"+cpbm+"' and cp_cpxx.khbh=hy_hyxxb.hykh";
		  sql+=" and hy_hyxxb.hyjb=hy_hyjbb.hyjbbh";
		  ps=conn.prepareStatement(sql);
		  rs=ps.executeQuery();
		  if(rs.next()){
	         khbh=rs.getString(1);
			 hykh=rs.getString(2);
			 hyjb=rs.getString(3);
		  }
		  rs.close();
		  ps.close();
		  //out.println(sql);
		  //�������۵�λ��ҵ����źͲ�Ʒ�����ѯ�ô�ҵ���иò�Ʒ�����Ǹ�����Ʒ����
		  sql="select max(xh) from cp_fszp where cpbm='"+cpbm+"'";
		  ps=conn.prepareStatement(sql);
		  rs=ps.executeQuery();
		  if(rs.next()){
		      xh=rs.getInt(1);
		  }
		  rs.close();
		  ps.close();
		  //out.println(sql);
		  //out.println(xh);
		  //���ݲ�Ʒ�������Ŵ�dm_zpxs,cp_zprk,xt_pmbm�в�ѯ��Ʒ��Ϣ
		  for(int j=1;j<=xh;j++){
		      sql="select xt_pmbm.pmmc from cp_fszp,cp_zprk,xt_pmbm";
			  sql+=" where cp_fszp.cpbm='"+cpbm+"' and cp_fszp.xh="+j+"";
			  sql+=" and cp_fszp.zpbm=cp_zprk.zpbm and cp_zprk.pmbm=xt_pmbm.pmbm";
			  //out.print(sql);
			  ps=conn.prepareStatement(sql);
			  rs=ps.executeQuery();
			  if(rs.next()){
				  zpmc=rs.getString(1);
			  }
			  rs.close();
			  ps.close();
			  zpmclb=zpmclb+"/"+zpmc;  //���ַ����ĵ�һλ��"/"��ʹ��ʱҪ�ӵڶ�λ��ʼ
	      }//end for loop for zp
%>
  <tr bgcolor=#ffffff>
    <td ><%=i+1%></td>
    <td ><%=cpbm%></td>
    <td ><%=plmc%></td>
    <td ><%=xsrq%></td>
    <td ><%=xsdwmc%></td>
    <td ><%=ywxh%></td>
    <td ><%=sxj%></td>
    <td ><%=thj%></td>
    <td ><%=thyy%></td>
    <td ><%=khbh%></td>
    <td ><%=hyjb%></td>
<% 
    //����Ǳ���λ���۵Ĳ�Ʒ����Ʒ�Ŀ��˱�־Ϊ���ˣ�0�����Ҳ�Ʒ������״̬Ϊ�����ۻ�����˻�
	//���ڱ���Ʒ��Ϣ֮����ʾ�����˻�����
    if(dwbh.equals(xsdw)&&ktbz.equals("0")&&(wlzt.equals("05")||wlzt.equals("13"))){
%>
    <td  align=center width=5%>
	<a href="dm_bdth.jsp?yhdlm=<%=yhdlm%>&thdw=<%=dwbh%>&cpbm=<%=cpbm%>&thrq=<%=thrq%>&thj=<%=thj%>&thyy=<%=thyy%>">�����˻�</a></td>
<% //������Ǳ���λ���۵Ĳ�Ʒ����Ʒ�Ŀ��˱�־Ϊ���ˣ�0�����Ҳ�Ʒ������״̬Ϊ������
	//���ڱ���Ʒ��Ϣ֮����ʾ����˻�
    }
	else if(!dwbh.equals(xsdw)&&ktbz.equals("0")&&wlzt.equals("05")){
%>
    <td  align=center width=5%>
	<a href="dm_ydth.jsp?yhdlm=<%=yhdlm%>&thdw=<%=dwbh%>&cpbm=<%=cpbm%>&thrq=<%=thrq%>&thj=<%=thj%>&thyy=<%=thyy%>">����˻�</a></td>
<%  //������ʾ������
    }else{
%>
  <td align="center">������</td>
<%}%>
  </tr>
<%
  if(xh!=0){
%>
<tr>
  <td  width=10% colspan="13" align=right bgcolor="#FFFFFF">������Ʒ����:<%=zpmclb.substring(1)%></td>
</tr>
<%}//end if(xh!=0)
    }//end for loop for cp
    wlzt="";
    }catch (Exception e) { 
	   out.print("���ݿ����ʧ�ܣ�" + e); 
    }finally{ 
        try{ 
	    if (ps!= null) ps.close();   
 	    if (rs!= null) rs.close();   
	    if (conn != null) cf.close(conn);   
	}catch (Exception e){  
	    out.println("���ݿ����ʧ�ܣ�"+e.getMessage());  
	}  
    }
  %>
</table>
</div>
</body>
</html>
