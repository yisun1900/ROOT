<%@ page contentType="text/html;charset=gb2312" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<%
String thdw=request.getParameter("thdw");
String thrq=request.getParameter("thrq");
String thczy=request.getParameter("czy");
String[] cpbmlist=request.getParameterValues("cpbmlist");
if (cpbmlist==null)
{
	out.println("�������˻���Ʒ���룡");
	return;
}
%>

<html>
<head>
<title>�鿴��Ϣ</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#FFFFFF">
<form name="thlist" method="post" action="savethList.jsp">
  <input type="hidden" name="thdw"  value="<%=thdw%>">
  <input type="hidden" name="thrq"  value="<%=thrq%>">
  <input type="hidden" name="thczy"  value="<%=thczy%>">
<table width="100%">
<%

String dwbh=null;
String dwmc=null;
String ywxh=null;
String cpbm=null;
String bqj=null;
String sxj=null;
String zkl=null;
String sjzkl=null;
String khlx=null;
String khlxmc=null;
String khbh=null;
String hykh=null;
String jyfsmc=null;
String jyfs=null;
String czy=null;
String xsrq=null;
String zkcx=null;
String shbz=null;
String shr=null;
String shrq=null;
String sfjs=null;

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
PreparedStatement ps1=null;
ResultSet rs1=null;
String ls_sql=null;
String wheresql="";

String cplb=null;
String bkbh=null;
String plmc=null;
String zp=null;
String hyxm="";
String hyjb="";
String fwlx="";
double xfzje=0;
int jf=0;
int row=0;

String wlzt="";
String ktbz="";
try {
	conn=cf.getConnection();

for (int i=0;i<cpbmlist.length ;i++ )
{
	//��ѧ��2003.9.24�޸ģ�ԭ�����۵Ĳ�ƷӦ�õ�cp_cpxx1�ж�ȡ
	//ls_sql=" select wlzt,ktbz from  cp_cpxx where cpbm='"+cpbmlist[i]+"'";
	ls_sql=" select wlzt,ktbz from  cp_cpxx1 where cpbm='"+cpbmlist[i]+"'";
	ps=conn.prepareStatement(ls_sql);
	rs=ps.executeQuery();
	if (rs.next())
	{
		wlzt=rs.getString(1);
		ktbz=cf.fillNull(rs.getString(2));
		if (!wlzt.equals("05"))
		{
			out.println("��Ʒ���룺"+cpbmlist[i]+"���������۲�Ʒ��");
			return;
		}
/*
*/
		if (ktbz.equals("1"))//0����1������
		{
//			out.println("��Ʒ���룺"+cpbmlist[i]+"�����ˣ�");
//			return;
		}
	}
	else{
		out.println("��Ʒ���룺"+cpbmlist[i]+"�����ڣ�");
		return;
	}
//11111111��ʼif///////////////////////////////
	ls_sql="select dm_xsjl.dwbh,dwmc,dm_xsjl.ywxh,dm_xsjl.cpbm,dm_xsjl.bkbh,plmc,dm_xsjl.bqj,dm_xsjl.sxj";
	ls_sql+=" ,dm_xsjl.zkl,dm_xsjl.sjzkl,DECODE(dm_xsjl.khlx,0,'һ��ͻ�',1,'��Ա') khlxmc,dm_xsjl.khlx";
	ls_sql+=" ,dm_xsjl.khbh,DECODE(dm_xsjl.jyfs,0,'�ֽ�',1,'���ֽ�') jyfsmc,dm_xsjl.jyfs jyfs";
	ls_sql+=" ,dm_xsjl.czy,dm_xsjl.xsrq,DECODE(dm_xsjl.zkcx,0,'δ����',1,'����') zkcx";
	ls_sql+=" ,DECODE(shbz,0,'δͨ��',1,'ͨ��',9,'δ���') shbz,shr,shrq";
	ls_sql+=" ,DECODE(sfjs,0,'δ����',1,'����') sfjs,zp,DECODE(dm_xsjl.cplb,'B','�ؽ���','A','��Ƕ��') cplb";
	ls_sql+=" from  dm_xsjl,xt_plbm,v_bk,sq_dwxx";
	ls_sql+=" where  dm_xsjl.cpbm='"+cpbmlist[i]+"' ";
	ls_sql+=" and dm_xsjl.dwbh=sq_dwxx.dwbh(+) ";
	ls_sql+=" and dm_xsjl.plbm=xt_plbm.plbm(+) and dm_xsjl.bkbh=v_bk.bkbh(+)";
	
//	out.println(ls_sql);
	ps=conn.prepareStatement(ls_sql);
	rs=ps.executeQuery();
	if (rs.next())
	{
		row++;
		dwbh=cf.fillNull(rs.getString("dwbh"));
		dwmc=rs.getString("dwmc");
		ywxh=cf.fillNull(rs.getString("ywxh"));
		cpbm=cf.fillNull(rs.getString(4));
		bqj=cf.fillNull(rs.getString("bqj"));
		bkbh=cf.fillNull(rs.getString("bkbh"));
		plmc=cf.fillNull(rs.getString("plmc"));
		sxj=cf.fillNull(rs.getString("sxj"));
		zkl=cf.fillNull(rs.getString("zkl"));
		sjzkl=cf.fillNull(rs.getString("sjzkl"));
		khlxmc=cf.fillNull(rs.getString("khlxmc"));
		khlx=cf.fillNull(rs.getString("khlx"));
		khbh=cf.fillNull(rs.getString("khbh"));
		jyfsmc=cf.fillNull(rs.getString("jyfsmc"));
		jyfs=cf.fillNull(rs.getString("jyfs"));
		czy=cf.fillNull(rs.getString("czy"));
		xsrq=cf.fillNull(rs.getDate("xsrq"));
		zkcx=cf.fillNull(rs.getString("zkcx"));
		shbz=cf.fillNull(rs.getString("shbz"));
		shr=cf.fillNull(rs.getString("shr"));
		shrq=cf.fillNull(rs.getDate("shrq"));
		sfjs=cf.fillNull(rs.getString("sfjs"));
		zp=cf.fillNull(rs.getString("zp"));
		cplb=cf.fillNull(rs.getString("cplb"));
		if (dwmc==null)
		{
			out.println("�������۵�λ�����ڣ���λ���룺"+dwbh);
			return;
		}
	
//		out.println("cpbm="+cpbm);
		
%>	
  <tr>
    <td width="100%" height="182"> 
      <div align="center">

          <table width="100%" border="1" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="1" cellspacing="0">
            <tr bgcolor="#FFFFFF" align="center"> 
              <td colspan="6"><b>��<%=row%>��������룺<%=cpbm%></b></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="14%"> 
                <div align="right">���۵�λ</div>
              </td>
              <td width="18%"> <%=dwmc%></td>
              <td width="14%" align="right">�������</td>
              <td width="18%"><%=ywxh%></td>
              <td rowspan="8" colspan="2"><%=zp%></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="14%" align="right">Ʒ��</td>
              <td colspan="3"><%=plmc%></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="14%" align="right">��Ʒ���</td>
              <td width="18%"><%=cplb%></td>
              <td width="14%" align="right">�����</td>
              <td width="18%"><%=bkbh%></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="14%" align="right">��ǩ��</td>
              <td width="18%"><%=bqj%></td>
              <td width="14%" align="right">ʵ����</td>
              <td width="18%"><%=sxj%></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="14%" align="right">����ۿ���</td>
              <td width="18%"><%=zkl%>%</td>
              <td width="14%" align="right">ʵ���ۿ���</td>
              <td width="18%"><%=sjzkl%>% </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="14%" align="right">���׷�ʽ</td>
              <td width="18%"><%=jyfsmc%></td>
              <td width="14%" align="right">�Ƿ����</td>
              <td width="18%"><%=sfjs%></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="14%"> 
                <div align="right">����Ա</div>
              </td>
              <td width="18%"><%=czy%> </td>
              <td width="14%" align="right">��������</td>
              <td width="18%"><%=xsrq%></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="14%"> 
                <div align="right">�ͻ�����</div>
              </td>
              <td width="18%"><%=khlxmc%></td>
              <td width="14%" align="right">�ۿ۳���</td>
              <td width="18%"><%=zkcx%></td>
            </tr>
<%
//222222222222222��ʼ��ʾ��Ա��Ϣ////////////////////////////////////////////////////////
		if (!khbh.equals(""))
		{
			ls_sql="select hyxm,hy_hyxxb.hyjb,DECODE(fwlx,1,'��������',2,'��ֵ����'),xfzje,jf,hykh";
			ls_sql+=" FROM hy_hyxxb,hy_hyjbb ";
			ls_sql+=" WHERE hy_hyxxb.hybh='"+khbh+"' AND hy_hyxxb.hyjb=hy_hyjbb.hyjbbh(+)"; 
//			out.println(ls_sql);
			ps1=conn.prepareStatement(ls_sql);
			rs1=ps1.executeQuery();
			if (rs1.next())
			{
				hyxm=cf.fillNull(rs1.getString("hyxm"));
				hyjb=cf.fillNull(rs1.getString(2));
				fwlx=cf.fillNull(rs1.getString(3));
				xfzje=rs1.getDouble("xfzje");
				jf=rs1.getInt("jf");
				hykh=cf.fillNull(rs1.getString("hykh"));
%> 
            <tr bgcolor="#FFFFFF"> 
              <td width="14%"> 
                <div align="right">��Ա���</div>
              </td>
              <td width="18%"> <%=khbh%> </td>
              <td width="14%" align="right">ˮ�ʷ�������</td>
              <td width="18%"><%=hykh%></td>
              <td width="14%"> 
                <div align="right">��Ա����</div>
              </td>
              <td width="22%"><%=hyjb%> </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="14%" align="right">��Ա����</td>
              <td width="18%"><%=hyxm%></td>
              <td width="14%" align="right">�����ܽ��</td>
              <td width="18%"><%=xfzje%></td>
              <td width="14%" align="right">����</td>
              <td width="22%"><%=jf%> </td>
            </tr>
            <%
			}
			rs1.close();
			ps1.close();
		}
//2222222222222������ʾ��Ա��Ϣ////////////////////////////////////////
%> 
            <tr bgcolor="#FFFFFF"> 
              <td width="14%"> 
                <div align="right">�������</div>
              </td>
              <td width="18%"><%=shbz%></td>
              <td width="14%" align="right">�����</td>
              <td width="18%"><%=shr%></td>
              <td width="14%"> 
                <div align="right">�������</div>
              </td>
              <td width="22%"><%=shrq%> </td>
            </tr>
            <tr bgcolor="#FFFFFF" align="center"> 
              <td colspan="6"><b>������Ʒ������Ϣ</b></td>
            </tr>
            <tr bgcolor="#FFFFFF" align="center"> 
              <td width="14%">���</td>
              <td width="18%">��Ʒ����</td>
              <td width="14%">����</td>
              <td width="18%">Ʒ��</td>
              <td width="14%">��������</td>
              <td width="22%">��Ʒ����</td>
            </tr>
            <%
//333333333333333/////////////////��ʼ��ʾ������Ʒ������Ϣ//////////////////////
	long xh=0;
	String zpbm=null;
	String zplx=null;
	int sl=0;
	double djzl=0;
	ls_sql="SELECT xh,zpbm,plmc,sl,djzl,DECODE(zplx,1,'��Ʒת��',2,'��Ʒ')  ";
	ls_sql+=" FROM dm_zpxs,xt_plbm  ";
    ls_sql+=" WHERE dm_zpxs.plbm=xt_plbm.plbm  and ywxh='"+ywxh+"' and cpbm='"+cpbm+"'";
//	out.println(ls_sql);
	ps1=conn.prepareStatement(ls_sql);
	rs1=ps1.executeQuery();
	while (rs1.next())
	{
		xh=rs1.getLong("xh");
		zpbm=rs1.getString("zpbm");
		plmc=rs1.getString("plmc");
		sl=rs1.getInt("sl");
		djzl=rs1.getDouble("djzl");
		zplx=rs1.getString(6);
%> 
            <tr bgcolor="#FFFFFF" align="center"> 
              <td width="14%"><%=xh%></td>
              <td width="18%"><%=zpbm%></td>
              <td width="18%"><%=sl%></td>
              <td width="14%"><%=plmc%></td>
              <td width="14%"><%=djzl%></td>
              <td width="22%"><%=zplx%></td>
            </tr>
            <%
	}
	rs1.close();
	ps1.close();
//3333333333/////////////////������ʾ������Ʒ������Ϣ//////////////////////
	String thlx="";
	if (dwbh.equals(thdw))
	{
		thlx="0";
	}
	else{
		thlx="1";
	}
%> 
            <tr bgcolor="#FFFFCC"> 
              <td width="14%" align="right">�˻�����</td>
              <td width="18%"> 
                <input type="hidden" name="jyfs"  value="<%=jyfs%>">
                <input type="hidden" name="dwbh"  value="<%=dwbh%>">
                <input type="hidden" name="sxj"  value="<%=sxj%>">
                <input type="hidden" name="ywxh"  value="<%=ywxh%>">
                <input type="hidden" name="khbh"  value="<%=khbh%>">
                <input type="hidden" name="khlx"  value="<%=khlx%>">
                <input type="hidden" name="cpbm"  value="<%=cpbm%>">

				<select name="thlx" style="FONT-SIZE:12px;WIDTH:83px">
<%
				if (thlx.equals("0"))
				{
					out.println("<option value=\"0\">�����˻�</option>");
				}
				else{
					out.println("<option value=\"1\">��껻��</option>");
					out.println("<option value=\"2\">����˻�</option>");
				}
%> 
				</select>
              </td>
              <td rowspan="2" align="right">�˻�ԭ��</td>
              <td colspan="3" rowspan="2"> 
                <textarea name="thyy" cols="35" rows="3"></textarea>
              </td>
            </tr>
            <tr bgcolor="#FFFFCC"> 
              <td width="14%"> 
                <div align="right">�˻����</div>
              </td>
              <td width="18%"> 
                <input type="text" name="thj" size="10">
              </td>
            </tr>
          </table>
	  </div>
    </td>
  </tr>
<%
	}
	else{
		out.println("���������ۼ�¼");
		return;
	}
//1111111111111����if///////////////////////////////
	rs.close();
	ps.close();
}
}
catch (Exception e) {
	out.print("Exception: " + e);
	return;
}
finally 
{
	try{
		if (rs != null) rs.close(); 
		if (ps != null) ps.close(); 
		if (rs1 != null) rs1.close(); 
		if (ps1 != null) ps1.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		out.println("�ر����ӷ�������,Exception:"+e.getMessage());
	}
}
%>
  <tr align="center"> 
    <td width="100%" height="2">
      <input type="submit" name="Submit" value="ȷ��">
    </td>
  </tr>
</table>
</form>
</body>
</html>
