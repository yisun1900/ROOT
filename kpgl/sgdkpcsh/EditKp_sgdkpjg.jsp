<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String kpjlh=null;
String sgd=null;
String sgdjbbm=null;
String zbj=null;
String bzs=null;
String jcf=null;
String kpgds=null;
String zjyzldf=null;
String xjyzldf=null;
String cczldf=null;
String zjyaqdf=null;
String xjyaqdf=null;
String ccaqdf=null;
String zjygqdf=null;
String zjygldf=null;
String xjygldf=null;
String ccgldf=null;
String khpjdf=null;
String tsdf=null;
String wxdf=null;
String ybjdf=null;
String bqdf=null;
String sqzf=null;
String bqzf=null;
String sqpm=null;
String bqpm=null;
String pmfd=null;
String hjwbz=null;
String qjwbz=null;
String sjbz=null;
String jjbz=null;
String ddbl=null;
String zdbl=null;
String xdbl=null;
String ddbzs=null;
String zdbzs=null;
String xdbzs=null;
String ddjls=null;
String zdjls=null;
String xdjls=null;
String kdds=null;
String kzds=null;
String kxds=null;
String tsjcdd=null;
String tsjczd=null;
String tsjcxd=null;
String kjdds=null;
String kjzds=null;
String kjxds=null;
String kjdzs=null;
String kjdze=null;
String yjdds=null;
String yjddje=null;
String yjzds=null;
String yjzdje=null;
String yjxds=null;
String yjxdje=null;
String ywgs=null;
String zsgds=null;
String yztscs=null;
String tbyztscs=null;
String fcyztscs=null;
String wherekpjlh=cf.GB2Uni(request.getParameter("kpjlh"));
String wheresgd=cf.GB2Uni(request.getParameter("sgd"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="select kpjlh,sgd,sgdjbbm,zbj,bzs,jcf,kpgds,zjyzldf,xjyzldf,cczldf,zjyaqdf,xjyaqdf,ccaqdf,zjygqdf,zjygldf,xjygldf,ccgldf,khpjdf,tsdf,wxdf,ybjdf,bqdf,sqzf,bqzf,sqpm,bqpm,pmfd,hjwbz,qjwbz,sjbz,jjbz,ddbl,zdbl,xdbl,ddbzs,zdbzs,xdbzs,ddjls,zdjls,xdjls,kdds,kzds,kxds,tsjcdd,tsjczd,tsjcxd,kjdds,kjzds,kjxds,kjdzs,kjdze,yjdds,yjddje,yjzds,yjzdje,yjxds,yjxdje,ywgs,zsgds,yztscs,tbyztscs,fcyztscs ";
	ls_sql+=" from  kp_sgdkpjg";
	ls_sql+=" where  (kpjlh="+wherekpjlh+") and  (sgd='"+wheresgd+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		kpjlh=cf.fillNull(rs.getString("kpjlh"));
		sgd=cf.fillNull(rs.getString("sgd"));
		sgdjbbm=cf.fillNull(rs.getString("sgdjbbm"));
		zbj=cf.fillNull(rs.getString("zbj"));
		bzs=cf.fillNull(rs.getString("bzs"));
		jcf=cf.fillNull(rs.getString("jcf"));
		kpgds=cf.fillNull(rs.getString("kpgds"));
		zjyzldf=cf.fillNull(rs.getString("zjyzldf"));
		xjyzldf=cf.fillNull(rs.getString("xjyzldf"));
		cczldf=cf.fillNull(rs.getString("cczldf"));
		zjyaqdf=cf.fillNull(rs.getString("zjyaqdf"));
		xjyaqdf=cf.fillNull(rs.getString("xjyaqdf"));
		ccaqdf=cf.fillNull(rs.getString("ccaqdf"));
		zjygqdf=cf.fillNull(rs.getString("zjygqdf"));
		zjygldf=cf.fillNull(rs.getString("zjygldf"));
		xjygldf=cf.fillNull(rs.getString("xjygldf"));
		ccgldf=cf.fillNull(rs.getString("ccgldf"));
		khpjdf=cf.fillNull(rs.getString("khpjdf"));
		tsdf=cf.fillNull(rs.getString("tsdf"));
		wxdf=cf.fillNull(rs.getString("wxdf"));
		ybjdf=cf.fillNull(rs.getString("ybjdf"));
		bqdf=cf.fillNull(rs.getString("bqdf"));
		sqzf=cf.fillNull(rs.getString("sqzf"));
		bqzf=cf.fillNull(rs.getString("bqzf"));
		sqpm=cf.fillNull(rs.getString("sqpm"));
		bqpm=cf.fillNull(rs.getString("bqpm"));
		pmfd=cf.fillNull(rs.getString("pmfd"));
		hjwbz=cf.fillNull(rs.getString("hjwbz"));
		qjwbz=cf.fillNull(rs.getString("qjwbz"));
		sjbz=cf.fillNull(rs.getString("sjbz"));
		jjbz=cf.fillNull(rs.getString("jjbz"));
		ddbl=cf.fillNull(rs.getString("ddbl"));
		zdbl=cf.fillNull(rs.getString("zdbl"));
		xdbl=cf.fillNull(rs.getString("xdbl"));
		ddbzs=cf.fillNull(rs.getString("ddbzs"));
		zdbzs=cf.fillNull(rs.getString("zdbzs"));
		xdbzs=cf.fillNull(rs.getString("xdbzs"));
		ddjls=cf.fillNull(rs.getString("ddjls"));
		zdjls=cf.fillNull(rs.getString("zdjls"));
		xdjls=cf.fillNull(rs.getString("xdjls"));
		kdds=cf.fillNull(rs.getString("kdds"));
		kzds=cf.fillNull(rs.getString("kzds"));
		kxds=cf.fillNull(rs.getString("kxds"));
		tsjcdd=cf.fillNull(rs.getString("tsjcdd"));
		tsjczd=cf.fillNull(rs.getString("tsjczd"));
		tsjcxd=cf.fillNull(rs.getString("tsjcxd"));
		kjdds=cf.fillNull(rs.getString("kjdds"));
		kjzds=cf.fillNull(rs.getString("kjzds"));
		kjxds=cf.fillNull(rs.getString("kjxds"));
		kjdzs=cf.fillNull(rs.getString("kjdzs"));
		kjdze=cf.fillNull(rs.getString("kjdze"));
		yjdds=cf.fillNull(rs.getString("yjdds"));
		yjddje=cf.fillNull(rs.getString("yjddje"));
		yjzds=cf.fillNull(rs.getString("yjzds"));
		yjzdje=cf.fillNull(rs.getString("yjzdje"));
		yjxds=cf.fillNull(rs.getString("yjxds"));
		yjxdje=cf.fillNull(rs.getString("yjxdje"));
		ywgs=cf.fillNull(rs.getString("ywgs"));
		zsgds=cf.fillNull(rs.getString("zsgds"));
		yztscs=cf.fillNull(rs.getString("yztscs"));
		tbyztscs=cf.fillNull(rs.getString("tbyztscs"));
		fcyztscs=cf.fillNull(rs.getString("fcyztscs"));
	}
	rs.close();
	ps.close();
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
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>

<html>
<head>
<title>�޸���Ϣ</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#FFFFFF">
<table width="100%">
  <tr>
    <td width="100%"> 
      <div align="center"> ʩ���ӿ�����ʼ�� </div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

<form method="post" action="SaveEditKp_sgdkpjg.jsp" name="editform">
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFFF"> 
              <td width="20%"> 
                <div align="right">������¼��</div>
              </td>
              <td width="30%"> 
                <input type="text" name="kpjlh" size="20" maxlength="8"  value="<%=kpjlh%>" readonly>
              </td>
              <td width="19%"> 
                <div align="right">ʩ����</div>
              </td>
              <td width="31%"> 
                <select name="sgd" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <%
	cf.selectItem(out,"select sgd,sgdmc from sq_sgd order by sgdmc",sgd,false);
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="20%"> 
                <div align="right">ʩ���Ӽ���</div>
              </td>
              <td width="30%"> 
                <select name="sgdjbbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select sgdjbbm,sgdjbmc from sq_sgdjbbm order by sgdjbbm",sgdjbbm);
%> 
                </select>
              </td>
              <td width="19%"> 
                <div align="right">�ʱ���</div>
              </td>
              <td width="31%"> 
                <input type="text" name="zbj" size="20" maxlength="8"  value="<%=zbj%>" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="20%"> 
                <div align="right">������</div>
              </td>
              <td width="30%"> 
                <input type="text" name="bzs" size="20" maxlength="8"  value="<%=bzs%>" >
              </td>
              <td width="19%"> 
                <div align="right">������</div>
              </td>
              <td width="31%"> 
                <input type="text" name="jcf" size="20" maxlength="8"  value="<%=jcf%>" >
              </td>
            </tr>
            <tr bgcolor="#FFFFCC"> 
              <td width="20%"> 
                <div align="right">�����ڿɽӴ�����</div>
              </td>
              <td width="30%"> 
                <input type="text" name="kjdds" size="20" maxlength="8"  value="<%=kjdds%>" >
              </td>
              <td width="19%"> 
                <div align="right">�����ڿɽ��е�����</div>
              </td>
              <td width="31%"> 
                <input type="text" name="kjzds" size="20" maxlength="8"  value="<%=kjzds%>" >
              </td>
            </tr>
            <tr bgcolor="#FFFFCC"> 
              <td width="20%"> 
                <div align="right">�����ڿɽ�С������</div>
              </td>
              <td width="30%"> 
                <input type="text" name="kjxds" size="20" maxlength="8"  value="<%=kjxds%>" >
              </td>
              <td width="19%"> 
                <div align="right"></div>
              </td>
              <td width="31%">&nbsp; </td>
            </tr>
            <tr bgcolor="#FFFFCC"> 
              <td width="20%" bgcolor="#FFFFCC"> 
                <div align="right">�����ڿɽӵ�����</div>
              </td>
              <td width="30%"> 
                <input type="text" name="kjdzs" size="20" maxlength="8"  value="<%=kjdzs%>" >
              </td>
              <td width="19%"> 
                <div align="right">�����ڿɽӵ��ܶ�</div>
              </td>
              <td width="31%"> 
                <input type="text" name="kjdze" size="20" maxlength="8"  value="<%=kjdze%>" >
              </td>
            </tr>
            <tr bgcolor="#CCCCFF"> 
              <td width="20%"> 
                <div align="right">�ѽӴ���</div>
              </td>
              <td width="30%"> 
                <input type="text" name="yjdds" size="20" maxlength="8"  value="<%=yjdds%>" >
              </td>
              <td width="19%"> 
                <div align="right">�ѽӴ󵥽��</div>
              </td>
              <td width="31%"> 
                <input type="text" name="yjddje" size="20" maxlength="8"  value="<%=yjddje%>" >
              </td>
            </tr>
            <tr bgcolor="#CCCCFF"> 
              <td width="20%"> 
                <div align="right">�ѽ��е���</div>
              </td>
              <td width="30%"> 
                <input type="text" name="yjzds" size="20" maxlength="8"  value="<%=yjzds%>" >
              </td>
              <td width="19%"> 
                <div align="right">�ѽ��е����</div>
              </td>
              <td width="31%"> 
                <input type="text" name="yjzdje" size="20" maxlength="8"  value="<%=yjzdje%>" >
              </td>
            </tr>
            <tr bgcolor="#CCCCFF"> 
              <td width="20%"> 
                <div align="right">�ѽ�С����</div>
              </td>
              <td width="30%"> 
                <input type="text" name="yjxds" size="20" maxlength="8"  value="<%=yjxds%>" >
              </td>
              <td width="19%"> 
                <div align="right">�ѽ�С�����</div>
              </td>
              <td width="31%"> 
                <input type="text" name="yjxdje" size="20" maxlength="8"  value="<%=yjxdje%>" >
              </td>
            </tr>
            <tr bgcolor="#FFFFCC"> 
              <td width="20%" align="right">���ڵ÷�</td>
              <td width="30%"> 
                <input type="text" name="bqdf" size="20" maxlength="8"  value="<%=bqdf%>" >
              </td>
              <td width="19%" align="right">��ʷ�ܵ÷�</td>
              <td width="31%"> 
                <input type="text" name="sqzf" size="20" maxlength="8"  value="<%=sqzf%>" >
              </td>
            </tr>
            <tr bgcolor="#FFFFCC"> 
              <td width="20%"> 
                <div align="right">�����ܷ�</div>
              </td>
              <td width="30%"> 
                <input type="text" name="bqzf" size="20" maxlength="8"  value="<%=bqzf%>" >
              </td>
              <td width="19%"> 
                <div align="right">��������</div>
              </td>
              <td width="31%"> 
                <input type="text" name="bqpm" size="20" maxlength="8"  value="<%=bqpm%>" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="20%"> 
                <div align="right">����������</div>
              </td>
              <td width="30%"> 
                <input type="text" name="kpgds" size="20" maxlength="8"  value="<%=kpgds%>" >
              </td>
              <td width="19%"> 
                <div align="right">�ʼ�Ա�����÷�</div>
              </td>
              <td width="31%"> 
                <input type="text" name="zjyzldf" size="20" maxlength="8"  value="<%=zjyzldf%>" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="20%"> 
                <div align="right">Ѳ��Ա�����÷�</div>
              </td>
              <td width="30%"> 
                <input type="text" name="xjyzldf" size="20" maxlength="8"  value="<%=xjyzldf%>" >
              </td>
              <td width="19%"> 
                <div align="right">��˾��������÷�</div>
              </td>
              <td width="31%"> 
                <input type="text" name="cczldf" size="20" maxlength="8"  value="<%=cczldf%>" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="20%"> 
                <div align="right">�ʼ�Ա��ȫ����ʩ���÷�</div>
              </td>
              <td width="30%"> 
                <input type="text" name="zjyaqdf" size="20" maxlength="8"  value="<%=zjyaqdf%>" >
              </td>
              <td width="19%"> 
                <div align="right">Ѳ��Ա��ȫ����ʩ���÷�</div>
              </td>
              <td width="31%"> 
                <input type="text" name="xjyaqdf" size="20" maxlength="8"  value="<%=xjyaqdf%>" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="20%"> 
                <div align="right">��˾��鰲ȫ����ʩ���÷�</div>
              </td>
              <td width="30%"> 
                <input type="text" name="ccaqdf" size="20" maxlength="8"  value="<%=ccaqdf%>" >
              </td>
              <td width="19%"> 
                <div align="right">�ʼ�Ա���ڵ÷�</div>
              </td>
              <td width="31%"> 
                <input type="text" name="zjygqdf" size="20" maxlength="8"  value="<%=zjygqdf%>" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="20%"> 
                <div align="right">�ʼ�Ա����÷�</div>
              </td>
              <td width="30%"> 
                <input type="text" name="zjygldf" size="20" maxlength="8"  value="<%=zjygldf%>" >
              </td>
              <td width="19%"> 
                <div align="right">Ѳ��Ա����÷�</div>
              </td>
              <td width="31%"> 
                <input type="text" name="xjygldf" size="20" maxlength="8"  value="<%=xjygldf%>" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="20%"> 
                <div align="right">��˾������÷�</div>
              </td>
              <td width="30%"> 
                <input type="text" name="ccgldf" size="20" maxlength="8"  value="<%=ccgldf%>" >
              </td>
              <td width="19%"> 
                <div align="right">�ͻ����۵÷�</div>
              </td>
              <td width="31%"> 
                <input type="text" name="khpjdf" size="20" maxlength="8"  value="<%=khpjdf%>" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="20%"> 
                <div align="right">Ͷ����÷�</div>
              </td>
              <td width="30%"> 
                <input type="text" name="tsdf" size="20" maxlength="8"  value="<%=tsdf%>" >
              </td>
              <td width="19%"> 
                <div align="right">ά����÷�</div>
              </td>
              <td width="31%"> 
                <input type="text" name="wxdf" size="20" maxlength="8"  value="<%=wxdf%>" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="20%"> 
                <div align="right">�������÷�</div>
              </td>
              <td width="30%"> 
                <input type="text" name="ybjdf" size="20" maxlength="8"  value="<%=ybjdf%>" >
              </td>
              <td width="19%"> 
                <div align="right">��������</div>
              </td>
              <td width="31%"> 
                <input type="text" name="sqpm" size="20" maxlength="8"  value="<%=sqpm%>" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="20%"> 
                <div align="right">���������ֶ�</div>
              </td>
              <td width="30%"> 
                <select name="pmfd" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectToken(out,"1+1��15λ&2+16��45λ&3+46λ�Ժ�",pmfd);
%> 
                </select>
              </td>
              <td width="19%"> 
                <div align="right">���3λ��־</div>
              </td>
              <td width="31%"> 
                <select name="hjwbz" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectToken(out,"Y+��&N+��",hjwbz);
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="20%"> 
                <div align="right">ǰ5λ��־</div>
              </td>
              <td width="30%"> 
                <select name="qjwbz" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectToken(out,"Y+��&N+��",qjwbz);
%> 
                </select>
              </td>
              <td width="19%"> 
                <div align="right">������־</div>
              </td>
              <td width="31%"> 
                <select name="sjbz" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectToken(out,"Y+��&N+��",sjbz);
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="20%"> 
                <div align="right">������־</div>
              </td>
              <td width="30%"> 
                <select name="jjbz" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectToken(out,"Y+��&N+��",jjbz);
%> 
                </select>
              </td>
              <td width="19%"> 
                <div align="right">�󵥱���</div>
              </td>
              <td width="31%"> 
                <input type="text" name="ddbl" size="20" maxlength="9"  value="<%=ddbl%>" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="20%"> 
                <div align="right">�е�����</div>
              </td>
              <td width="30%"> 
                <input type="text" name="zdbl" size="20" maxlength="9"  value="<%=zdbl%>" >
              </td>
              <td width="19%"> 
                <div align="right">С������</div>
              </td>
              <td width="31%"> 
                <input type="text" name="xdbl" size="20" maxlength="9"  value="<%=xdbl%>" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="20%"> 
                <div align="right">�ɽӴ󵥱�׼��</div>
              </td>
              <td width="30%"> 
                <input type="text" name="ddbzs" size="20" maxlength="8"  value="<%=ddbzs%>" >
              </td>
              <td width="19%"> 
                <div align="right">�ɽ��е���׼��</div>
              </td>
              <td width="31%"> 
                <input type="text" name="zdbzs" size="20" maxlength="8"  value="<%=zdbzs%>" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="20%"> 
                <div align="right">�ɽ�С����׼��</div>
              </td>
              <td width="30%"> 
                <input type="text" name="xdbzs" size="20" maxlength="8"  value="<%=xdbzs%>" >
              </td>
              <td width="19%"> 
                <div align="right">�󵥻ص�������</div>
              </td>
              <td width="31%"> 
                <input type="text" name="ddjls" size="20" maxlength="8"  value="<%=ddjls%>" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="20%"> 
                <div align="right">�е��ص�������</div>
              </td>
              <td width="30%"> 
                <input type="text" name="zdjls" size="20" maxlength="8"  value="<%=zdjls%>" >
              </td>
              <td width="19%"> 
                <div align="right">С���ص�������</div>
              </td>
              <td width="31%"> 
                <input type="text" name="xdjls" size="20" maxlength="8"  value="<%=xdjls%>" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="20%"> 
                <div align="right">�ش�Ͷ�߿۴�</div>
              </td>
              <td width="30%"> 
                <input type="text" name="kdds" size="20" maxlength="8"  value="<%=kdds%>" >
              </td>
              <td width="19%"> 
                <div align="right">�ش�Ͷ�߿��е�</div>
              </td>
              <td width="31%"> 
                <input type="text" name="kzds" size="20" maxlength="8"  value="<%=kzds%>" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="20%"> 
                <div align="right">�ش�Ͷ�߿�С��</div>
              </td>
              <td width="30%"> 
                <input type="text" name="kxds" size="20" maxlength="8"  value="<%=kxds%>" >
              </td>
              <td width="19%"> 
                <div align="right">���⽱���򴦷���</div>
              </td>
              <td width="31%"> 
                <input type="text" name="tsjcdd" size="20" maxlength="8"  value="<%=tsjcdd%>" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="20%"> 
                <div align="right">���⽱���򴦷��е�</div>
              </td>
              <td width="30%"> 
                <input type="text" name="tsjczd" size="20" maxlength="8"  value="<%=tsjczd%>" >
              </td>
              <td width="19%"> 
                <div align="right">���⽱���򴦷�С��</div>
              </td>
              <td width="31%"> 
                <input type="text" name="tsjcxd" size="20" maxlength="8"  value="<%=tsjcxd%>" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="20%" align="right">��ʩ������</td>
              <td width="30%"> 
                <input type="text" name="zsgds" size="20" maxlength="8"  value="<%=zsgds%>" >
              </td>
              <td width="19%" align="right">���깤��</td>
              <td width="31%"> 
                <input type="text" name="ywgs" size="20" maxlength="8"  value="<%=ywgs%>" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="20%"> 
                <div align="right">����Ͷ�ߴ���</div>
              </td>
              <td width="30%"> 
                <input type="text" name="yztscs" size="20" maxlength="8"  value="<%=yztscs%>" >
              </td>
              <td width="19%"> 
                <div align="right"></div>
              </td>
              <td width="31%">&nbsp; </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="20%"> 
                <div align="right">�ر�����Ͷ�ߴ���</div>
              </td>
              <td width="30%"> 
                <input type="text" name="tbyztscs" size="20" maxlength="8"  value="<%=tbyztscs%>" >
              </td>
              <td width="19%"> 
                <div align="right">�ǳ�����Ͷ�ߴ���</div>
              </td>
              <td width="31%"> 
                <input type="text" name="fcyztscs" size="20" maxlength="8"  value="<%=fcyztscs%>" >
              </td>
            </tr>
            <input type="hidden" name="wherekpjlh"  value="<%=wherekpjlh%>" >
            <input type="hidden" name="wheresgd"  value="<%=wheresgd%>" >
            <tr> 
              <td colspan="4" height="2"> &nbsp; 
                <div align="center"> 
                  <input type="button"  value="����" onClick="f_do(editform)">
                  <input type="reset"  value="����">
                </div>
              </td>
            </tr>
          </table>
</form>

	  
	  </div>
    </td>
  </tr>
</table>
</body>
</html>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
function f_do(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.kpjlh)=="") {
		alert("������[������¼��]��");
		FormName.kpjlh.focus();
		return false;
	}
	if(!(isNumber(FormName.kpjlh, "������¼��"))) {
		return false;
	}
	if(	javaTrim(FormName.sgd)=="") {
		alert("��ѡ��[ʩ����]��");
		FormName.sgd.focus();
		return false;
	}
	if(!(isNumber(FormName.zbj, "�ʱ���"))) {
		return false;
	}
	if(!(isNumber(FormName.bzs, "������"))) {
		return false;
	}
	if(!(isNumber(FormName.jcf, "������"))) {
		return false;
	}
	if(	javaTrim(FormName.kpgds)=="") {
		alert("������[����������]��");
		FormName.kpgds.focus();
		return false;
	}
	if(!(isNumber(FormName.kpgds, "����������"))) {
		return false;
	}
	if(!(isNumber(FormName.zjyzldf, "�ʼ�Ա�����÷�"))) {
		return false;
	}
	if(!(isNumber(FormName.xjyzldf, "Ѳ��Ա�����÷�"))) {
		return false;
	}
	if(!(isNumber(FormName.cczldf, "��˾��������÷�"))) {
		return false;
	}
	if(!(isNumber(FormName.zjyaqdf, "�ʼ�Ա��ȫ����ʩ���÷�"))) {
		return false;
	}
	if(!(isNumber(FormName.xjyaqdf, "Ѳ��Ա��ȫ����ʩ���÷�"))) {
		return false;
	}
	if(!(isNumber(FormName.ccaqdf, "��˾��鰲ȫ����ʩ���÷�"))) {
		return false;
	}
	if(!(isNumber(FormName.zjygqdf, "�ʼ�Ա���ڵ÷�"))) {
		return false;
	}
	if(!(isNumber(FormName.zjygldf, "�ʼ�Ա����÷�"))) {
		return false;
	}
	if(!(isNumber(FormName.xjygldf, "Ѳ��Ա����÷�"))) {
		return false;
	}
	if(!(isNumber(FormName.ccgldf, "��˾������÷�"))) {
		return false;
	}
	if(!(isNumber(FormName.khpjdf, "�ͻ����۵÷�"))) {
		return false;
	}
	if(!(isNumber(FormName.tsdf, "Ͷ����÷�"))) {
		return false;
	}
	if(!(isNumber(FormName.wxdf, "ά����÷�"))) {
		return false;
	}
	if(!(isNumber(FormName.ybjdf, "�������÷�"))) {
		return false;
	}
	if(!(isNumber(FormName.bqdf, "���ڵ÷�"))) {
		return false;
	}
	if(!(isNumber(FormName.sqzf, "��ʷ�ܵ÷�"))) {
		return false;
	}
	if(!(isNumber(FormName.bqzf, "�����ܷ�"))) {
		return false;
	}
	if(!(isNumber(FormName.sqpm, "��������"))) {
		return false;
	}
	if(!(isNumber(FormName.bqpm, "��������"))) {
		return false;
	}
	if(!(isFloat(FormName.ddbl, "�󵥱���"))) {
		return false;
	}
	if(!(isFloat(FormName.zdbl, "�е�����"))) {
		return false;
	}
	if(!(isFloat(FormName.xdbl, "С������"))) {
		return false;
	}
	if(!(isNumber(FormName.ddbzs, "�ɽӴ󵥱�׼��"))) {
		return false;
	}
	if(!(isNumber(FormName.zdbzs, "�ɽ��е���׼��"))) {
		return false;
	}
	if(!(isNumber(FormName.xdbzs, "�ɽ�С����׼��"))) {
		return false;
	}
	if(!(isNumber(FormName.ddjls, "�󵥻ص�������"))) {
		return false;
	}
	if(!(isNumber(FormName.zdjls, "�е��ص�������"))) {
		return false;
	}
	if(!(isNumber(FormName.xdjls, "С���ص�������"))) {
		return false;
	}
	if(!(isNumber(FormName.kdds, "�ش�Ͷ�߿۴�"))) {
		return false;
	}
	if(!(isNumber(FormName.kzds, "�ش�Ͷ�߿��е�"))) {
		return false;
	}
	if(!(isNumber(FormName.kxds, "�ش�Ͷ�߿�С��"))) {
		return false;
	}
	if(!(isNumber(FormName.tsjcdd, "���⽱���򴦷���"))) {
		return false;
	}
	if(!(isNumber(FormName.tsjczd, "���⽱���򴦷��е�"))) {
		return false;
	}
	if(!(isNumber(FormName.tsjcxd, "���⽱���򴦷�С��"))) {
		return false;
	}
	if(!(isNumber(FormName.kjdds, "�����ڿɽӴ�����"))) {
		return false;
	}
	if(!(isNumber(FormName.kjzds, "�����ڿɽ��е�����"))) {
		return false;
	}
	if(!(isNumber(FormName.kjxds, "�����ڿɽ�С������"))) {
		return false;
	}
	if(!(isNumber(FormName.kjdzs, "�����ڿɽӵ�����"))) {
		return false;
	}
	if(!(isNumber(FormName.kjdze, "�����ڿɽӵ��ܶ�"))) {
		return false;
	}
	if(!(isNumber(FormName.yjdds, "�ѽӴ���"))) {
		return false;
	}
	if(!(isNumber(FormName.yjddje, "�ѽӴ󵥽��"))) {
		return false;
	}
	if(!(isNumber(FormName.yjzds, "�ѽ��е���"))) {
		return false;
	}
	if(!(isNumber(FormName.yjzdje, "�ѽ��е����"))) {
		return false;
	}
	if(!(isNumber(FormName.yjxds, "�ѽ�С����"))) {
		return false;
	}
	if(!(isNumber(FormName.yjxdje, "�ѽ�С�����"))) {
		return false;
	}
	if(!(isNumber(FormName.ywgs, "���깤��"))) {
		return false;
	}
	if(!(isNumber(FormName.zsgds, "��ʩ������"))) {
		return false;
	}
	if(!(isNumber(FormName.yztscs, "����Ͷ�ߴ���"))) {
		return false;
	}
	if(!(isNumber(FormName.tbyztscs, "�ر�����Ͷ�ߴ���"))) {
		return false;
	}
	if(!(isNumber(FormName.fcyztscs, "�ǳ�����Ͷ�ߴ���"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
