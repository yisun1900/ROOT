<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*,org.apache.axis.client.Call,org.apache.axis.client.Service,webservice.bean.*,javax.xml.namespace.QName,org.apache.axis.encoding.ser.*,javax.xml.rpc.*,java.text.*'%>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<html>
<head>
<title>付款计划修改</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<body bgcolor="#FFFFFF">
<%
	
	    String yhmc=(String)session.getAttribute("yhmc");
		String fkjhxh=request.getParameter("fkjhxh");
		
			//String orderId;  //订单编号
			//String id=null;//收款序号
			String contractId=null;  //合同编号
			Double amount=0.00;// 收款金额
			java.util.Date payTime=null;// 收款日期
			String payType=null;// 付款方式
			String billNo=null;// 票据编号
			String payForUse=null;// 款项用途
			String remark=null;// 备注信息
			String person=null;// 录入人
			java.util.Date time=null;// 录入时间

			String khbh=null;
			
            try {
                 
					
					Connection conn  = null;
					PreparedStatement ps=null;
					ResultSet rs=null;
					String ls_sql=null;
					//String khbh=null;
					conn=cf.getConnection();
					ls_sql="select fkjhxh,khbh,fklxbm,fkcs,yfksj,yfkje,fkzt,lrr,lrsj,lrbm,bz ";
					ls_sql+=" from cw_jzfkjh ";
					ls_sql+=" where fkjhxh='"+fkjhxh+"' ";
					ps= conn.prepareStatement(ls_sql);
					rs =ps.executeQuery();
					if (rs.next())
					{
						khbh=rs.getString("khbh");
						fkjhxh=rs.getString("fkjhxh");
						amount=rs.getDouble("yfkje");;// 收款金额
						payTime=rs.getDate("yfksj");// 收款日期
						payType=null;// 付款方式
						billNo=null;// 票据编号
						payForUse=rs.getString("fkcs");// 款项用途
						remark=rs.getString("bz");// 备注信息
						if(remark==null)
							remark="";
						
					}
					rs.close();
					ps.close();
					 %>
<table width="100%">
  <tr>
    <td width="100%"> 
      <div align="center">付款计划修改</div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

		<form method="post" action="SaveFkjh.jsp" name="insertform" >
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr  bgcolor="#FFFFFF"> 
			
              <td width="18%"> 
                <div align="right">付款序号</div> </td>
				<td width="32%"><%=fkjhxh%><input type="hidden" name="id" value="<%=fkjhxh%>"></td>
               <td width="18%"> 
                <div align="right">客户编号</div>              </td>
				<td width="32%"><%=khbh%><input type="hidden" name="khbh" value="<%=khbh%>"></td>
				</tr>
				  <tr  bgcolor="#FFFFFF"> 
				   <td > 
                <div align="right">款项用途</div>              </td>
				<td ><select name="fkcs" onchange="f_getYfk(insertform)">
                <%
	cf.selectItem(out,"select cw_fkfamx.fkcs,cw_fkcs.fkcsmc||':'||cw_fkfamx.bqfkbl||'%' from cw_fkcs,cw_fkfamx,cw_khfkfa where cw_fkcs.fkcs=cw_fkfamx.fkcs and cw_fkfamx.fkfabm=cw_khfkfa.fkfabm and cw_khfkfa.khbh='"+khbh+"' and fkcs='"+payForUse+"' order by cw_fkfamx.fkcs","");
			%> 
					</select>
				</td>
				 <td > 
                <div align="right">计划付款金额</div>              </td>
				<td ><input type="text" name="yfkje" value="<%=amount%>" readOnly></td>
				</tr>
				<tr bgcolor="#FFFFFF">
				 <td > 
                <div align="right">计划付款日期</div>              </td>
					<td colspan=3><input type="text" name="sksj"value="<%=payTime%>" ondblclick="JSCalendar(this)"></td>
					</tr>
				<tr  bgcolor="#FFFFFF">
				
				 <td > 
                <div align="right">计划描述</div>              </td>
				<td colspan=3><textarea name="jhms" cols="73" rows="6" width="70%"><%=remark%></textarea></td>
				</tr>
			

			<tr><td align="center" colspan="4"><input type="button" value="保存" onclick="f_do(insertform)"></td></tr>		 
					
					 <%
					 
			}catch (Exception e) {
			out.println(e.getMessage());
			return;
			}
				 
		%>

           
          </table>

	</form>
	  
	  </div>
    </td>
  </tr>
</table>
</body>
</html>
<SCRIPT language=javascript  src='/js/JSCalendar.js'></SCRIPT>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
	String.prototype.trim  =  function()
	{
 	       return  this.replace(/(^\s*)|(\s*$)/g,  "");
	} 
	var http_request=false;
	function send_request(url){
		http_request=false;
		if(window.XMLHttpRequest){
			http_request=new XMLHttpRequest();
			if(http_request.overrideMimeType){
				http_request.overrideMimeType("text/xml");
			}
		}
		else if(window.ActiveXObject){
			try{
				http_request=new ActiveXObject("Msxml2.XMLHTTP");
			}
			catch(e){
				try{
					http_request=new ActiveXObject("Microsoft.XMLHTTP");
				}
				catch(e){}
			}

		}
		if(!http_request){
			window.alert("不能创建XMLHttpRequest对象实例！");
			return false;
		}
		http_request.onreadystatechange=processRequest;
		http_request.open("POST",url,true);
		http_request.send(null);
	}

	function processRequest(){
		if(http_request.readyState==4){
			if(http_request.status==200){
					doactions(http_request.responseText);
			}
			else{
				alert("您所请求的页面有异常！");
			}
		}
	}

function f_getYfk(FormName)
{
	FormName.yfkje.value="";
	//FormName.yfkbl.value="";

	var str="CxFkjeByAjax.jsp?hth=<%=contractId%>&fkcs="+FormName.fkcs.value;
	//open(str);
	send_request(str);
	
}

  function doactions(v)
	  {
		
        document.insertform.yfkje.value=v;
      
      }

function f_do(FormName)//参数FormName:Form的名称
{

	if(	javaTrim(FormName.fkxh)=="") {
		alert("请输入[收款序号]！");
		FormName.fkxh.focus();
		return false;
	}

	
	if(	javaTrim(FormName.fkcs)=="") {
		alert("请选择[收款期数]！");
		FormName.fkcs.focus();
		return false;
	}
	if(!(isNumber(FormName.fkcs, "收款期数"))) {
		return false;
	}
	
	


	if(!(isFloat(FormName.yfkje, "应收款金额"))) {
		return false;
	}

	


	
	
	if(	javaTrim(FormName.sksj)=="") {
		alert("请输入[收款时间]！");
		FormName.sksj.focus();
		return false;
	}
	if(!(isDatetime(FormName.sksj, "收款时间"))) {
		return false;
	}
	
	

	//FormName.target="_blank";
	FormName.action="SaveFkjh.jsp";
	FormName.submit();
	
	return true;
}

//-->
</SCRIPT>
